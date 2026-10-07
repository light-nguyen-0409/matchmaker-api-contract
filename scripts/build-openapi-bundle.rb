#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "time"
require "yaml"

ROOT = File.expand_path("..", __dir__)
OPENAPI_YAML = File.join(ROOT, "openapi.yaml")
EPSILON_JSON = File.join(ROOT, "epsilon-openapi.json")
OUTPUT_JSON = File.join(ROOT, "openapi-bundle.json")

HTTP_METHODS = %w[get put post delete options head patch trace].freeze

ADAPTER_LABELS = {
  "epsilon" => "Epsilon",
  "bespoke" => "Bespoke / non-Epsilon",
}.freeze

ADAPTER_SECURITY_SCHEMES = {
  "epsilon" => %w[
    epsilonBasicAuth
    masterUserAuth
    clientUserAuth
    candidateUserAuth
  ],
  "bespoke" => %w[bespokeBasicAuth],
}.freeze

def operation_adapter(operation)
  return "bespoke" if operation["x-crs-adapter"] == "Bespoke / non-Epsilon"
  return "epsilon" if operation["x-crs-adapter"] == "Epsilon"

  tags = operation.fetch("tags", [])
  return "bespoke" if tags.include?("Bespoke / non-Epsilon")
  return "epsilon" if tags.include?("Epsilon")

  nil
end

def operation_count(document)
  document.fetch("paths", {}).sum do |_path, path_item|
    path_item.count { |method, _operation| HTTP_METHODS.include?(method) }
  end
end

def path_count(document)
  document.fetch("paths", {}).length
end

def annotate_operation!(operation, group_id, adapter, source_file)
  operation["x-api-group"] = group_id
  operation["x-api-adapter"] = adapter
  operation["x-source-file"] = source_file
end

def build_adapter_document(source, adapter, group_id)
  document = JSON.parse(JSON.generate(source))
  label = ADAPTER_LABELS.fetch(adapter)
  paths = {}
  used_tags = { label => true }

  document.fetch("paths", {}).each do |path, path_item|
    filtered_path_item = {}
    has_operation = false

    path_item.each do |key, value|
      unless HTTP_METHODS.include?(key)
        filtered_path_item[key] = value
        next
      end

      next unless operation_adapter(value) == adapter

      annotate_operation!(value, group_id, label, "openapi.yaml")
      filtered_path_item[key] = value
      has_operation = true
      value.fetch("tags", []).each { |tag| used_tags[tag] = true }
    end

    paths[path] = filtered_path_item if has_operation
  end

  document["paths"] = paths
  document["info"] = document.fetch("info", {}).merge(
    "title" => "#{document.dig("info", "title")} — #{label}",
    "description" => "#{document.dig("info", "description")}\n\nThis view contains only #{label} operations.",
  )
  document["tags"] = document.fetch("tags", []).select { |tag| used_tags[tag["name"]] }

  components = document.fetch("components", {})
  security_schemes = components.fetch("securitySchemes", {})
  components["securitySchemes"] = security_schemes.select do |name, _scheme|
    ADAPTER_SECURITY_SCHEMES.fetch(adapter).include?(name)
  end
  document["components"] = components
  document["security"] = [{ "bespokeBasicAuth" => [] }] if adapter == "bespoke"

  document["x-api-group"] = group_id
  document["x-api-adapter"] = label
  document["x-source-file"] = "openapi.yaml"
  document
end

def build_official_document(source)
  document = JSON.parse(JSON.generate(source))
  document.fetch("paths", {}).each_value do |path_item|
    path_item.each do |method, operation|
      next unless HTTP_METHODS.include?(method)

      annotate_operation!(operation, "epsilon-official", "Epsilon", "epsilon-openapi.json")
    end
  end

  document["x-api-group"] = "epsilon-official"
  document["x-api-adapter"] = "Epsilon"
  document["x-source-file"] = "epsilon-openapi.json"
  document
end

def group_metadata(id, name, adapter, role, source_file, document)
  {
    "id" => id,
    "name" => name,
    "adapter" => adapter,
    "role" => role,
    "source" => {
      "file" => source_file,
      "format" => document["swagger"] || document["openapi"],
      "title" => document.dig("info", "title"),
      "version" => document.dig("info", "version"),
    },
    "pathCount" => path_count(document),
    "operationCount" => operation_count(document),
    "document" => document,
  }
end

crs_source = YAML.load_file(OPENAPI_YAML)
official_source = JSON.parse(File.read(EPSILON_JSON))

official_document = build_official_document(official_source)
epsilon_document = build_adapter_document(crs_source, "epsilon", "epsilon-crs")
bespoke_document = build_adapter_document(crs_source, "bespoke", "bespoke")

bundle = {
  "bundleType" => "matchmaker-api-document-bundle",
  "bundleVersion" => "1.0.0",
  "title" => "MatchMaker API documentation bundle",
  "description" => "The complete official Epsilon catalog plus the CRS Epsilon and Bespoke/non-Epsilon adapter documents.",
  "generatedAt" => Time.now.utc.iso8601,
  "sourceDocuments" => [
    {
      "file" => "epsilon-openapi.json",
      "role" => "official Epsilon catalog",
      "format" => "Swagger 2.0",
    },
    {
      "file" => "openapi.yaml",
      "role" => "CRS adapter contract",
      "format" => "OpenAPI 3.0.3",
    },
  ],
  "groups" => [
    group_metadata(
      "epsilon-official",
      "Official Epsilon catalog",
      "Epsilon",
      "official-reference",
      "epsilon-openapi.json",
      official_document,
    ),
    group_metadata(
      "epsilon-crs",
      "CRS Epsilon adapter",
      "Epsilon",
      "crs-integration",
      "openapi.yaml",
      epsilon_document,
    ),
    group_metadata(
      "bespoke",
      "CRS Bespoke / non-Epsilon adapter",
      "Bespoke / non-Epsilon",
      "crs-integration",
      "openapi.yaml",
      bespoke_document,
    ),
  ],
}

File.write(OUTPUT_JSON, JSON.pretty_generate(bundle) + "\n")
puts "Wrote #{OUTPUT_JSON}"
puts "Groups: #{bundle.fetch("groups").map { |group| "#{group["id"]}=#{group["operationCount"]} operations" }.join(", ")}"

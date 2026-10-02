# MatchMaker API Contract

Static OpenAPI contract and Swagger UI for CRS integration with MatchMaker/Epsilon.

## Files

- openapi.yaml — OpenAPI 3.0.3 contract.
- index.html — static Swagger UI entry point.
- .github/workflows/deploy-pages.yml — GitHub Pages deployment.

## Local preview

Serve this directory with any static file server, then open index.html.

## GitHub Pages

Enable GitHub Pages with GitHub Actions as the publishing source. Every push to
main deploys the static Swagger UI.

## Security

This repository must not contain MatchMaker credentials, tokens, or private
environment values. Try it out is disabled by default because the browser would
call MatchMaker directly.

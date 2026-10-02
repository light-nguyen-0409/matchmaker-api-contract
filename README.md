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

## Authentication headers

All requests use Basic authentication. Depending on the CRS adapter state, a
request may also include one or more conditional token headers:

| Header | Type | Wire format | Status |
|---|---|---|---|
| `Authorization` | string | `Basic ` + base64(`username:password`) | Required |
| `MasterUserAuth` | string | base64(`peo_no:usr_token`) | Conditional |
| `CliUserAuth` | string | base64(`peo_no:usr_token`) | Conditional/reserved |
| `CanUserAuth` | string | base64(`peo_no:usr_token`) | Conditional/reserved |

The custom headers are declared as security schemes in `openapi.yaml`. Their
requiredness per endpoint must be confirmed by MatchMaker; the current CRS
implementation does not send all three headers on every call.

## Security

This repository must not contain MatchMaker credentials, tokens, or private
environment values. Try it out is disabled by default because the browser would
call MatchMaker directly.

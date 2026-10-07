# MatchMaker API Contract

> **API contract online:** [https://light-nguyen-0409.github.io/matchmaker-api-contract/](https://light-nguyen-0409.github.io/matchmaker-api-contract/)

Static OpenAPI contract and Swagger UI for CRS integration with both
MatchMaker/Epsilon and Bespoke/non-Epsilon calls.

The contract has two adapter groups:

- **Epsilon** — calls made through `App\Externals\EpsilonApi`.
- **Bespoke / non-Epsilon** — calls made directly by the CRS Bespoke/legacy
  integration path.

The Epsilon source used for the current verification is the official
[Swagger UI](https://support.matchmakersoftware.com:31006/help/index#) and its
[discovery document](https://support.matchmakersoftware.com:31006/docs/2.0.1.0/swagger),
version `2.0.1.0` (274 published paths, checked 2026-10-06).

## Files

- openapi.yaml — OpenAPI 3.0.3 contract.
- index.html — static Swagger UI entry point.
- .github/workflows/deploy-pages.yml — GitHub Pages deployment.

The contract is intentionally scoped to the CRS integration inventory. It
keeps Epsilon calls separate from Bespoke/non-Epsilon calls made by the CRS
codebase; it is not a complete mirror of all 274 Epsilon paths.

The input/output and datatype audit is recorded in
[`matchmaker-api-docs.md`](matchmaker-api-docs.md), section 1.4. It includes the
official success response type even where CRS currently checks only HTTP status,
and marks route, body, multipart, date-format and field-type differences between
the official Epsilon Swagger and the current CRS adapter.

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

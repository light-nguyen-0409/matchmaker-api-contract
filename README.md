# MatchMaker API Contract

> **API contract online:** [https://light-nguyen-0409.github.io/matchmaker-api-contract/](https://light-nguyen-0409.github.io/matchmaker-api-contract/)

> **Swagger views:** [Epsilon](https://light-nguyen-0409.github.io/matchmaker-api-contract/#epsilon) · [Bespoke / non-Epsilon](https://light-nguyen-0409.github.io/matchmaker-api-contract/#bespoke)

Static OpenAPI contract and Swagger UI for CRS integration with both
MatchMaker/Epsilon and Bespoke/non-Epsilon calls.

The contract has two adapter groups:

- **Epsilon** — calls made through `App\Externals\EpsilonApi`.
- **Bespoke / non-Epsilon** — calls made directly by the CRS Bespoke/legacy
  integration path.

The Epsilon source used for the current verification is the official
[Swagger UI](https://support.matchmakersoftware.com:31006/help/index#) and its
[discovery document](https://support.matchmakersoftware.com:31006/docs/2.0.1.0/swagger),
version `2.0.1.0` (274 published paths, snapshot checked 2026-10-07).

## Files

- openapi.yaml — OpenAPI 3.0.3 contract.
- epsilon-openapi.json — complete official Epsilon Swagger 2.0.1.0 snapshot (274 paths, 275 operations).
- openapi-bundle.json — generated JSON bundle containing the complete official Epsilon catalog, the CRS Epsilon adapter document, and the CRS Bespoke/non-Epsilon adapter document.
- scripts/build-openapi-bundle.rb — regenerates `openapi-bundle.json` from the two source specifications.
- official-epsilon-api-gap.md — inventory of the 238 official path entries added beyond the previous CRS inventory.
- index.html — static Swagger UI entry point with separate Epsilon and Bespoke / non-Epsilon views.
- .github/workflows/deploy-pages.yml — GitHub Pages deployment.

`openapi.yaml` remains scoped to the current CRS integration inventory and keeps
the Epsilon and Bespoke/non-Epsilon adapter metadata together. The hosted
Epsilon view loads the complete official catalog from `epsilon-openapi.json` and
keeps a separate CRS Epsilon adapter inventory below it, while the Bespoke view
shows only the direct CRS routes.

`openapi-bundle.json` is an envelope JSON document for consumers that need all
three views in one file. Its `groups` array contains `epsilon-official`,
`epsilon-crs`, and `bespoke`. Each group includes `adapter`, `source`, path and
operation counts, and the complete nested `document`. Each operation also has
the `x-api-group` extension, so consumers can identify its group without
depending on the array position. Regenerate it after changing either source
specification:

```sh
ruby scripts/build-openapi-bundle.rb
```

The bundle intentionally keeps the three specifications as nested documents.
This preserves both the official Epsilon definition and the CRS definition
when the same path and method appear in both documents.

The input/output and datatype audit is recorded in
[`matchmaker-api-docs.md`](matchmaker-api-docs.md), section 1.4. It includes the
official success response type even where CRS currently checks only HTTP status,
and marks route, body, multipart, date-format and field-type differences between
the official Epsilon Swagger and the current CRS adapter.

## Local preview

Serve this directory with any static file server, then open `index.html#epsilon` or
`index.html#bespoke` to view one adapter group at a time. The Epsilon view uses
the official snapshot plus the current CRS Epsilon adapter inventory; the
Bespoke view is derived from `openapi.yaml`.

## GitHub Pages

Enable GitHub Pages with GitHub Actions as the publishing source. Every push to
main deploys the static Swagger UI.

## Authentication

Both adapters use Basic authentication on the wire, but they do not share the
credential source:

| Adapter | OpenAPI security scheme | Credential source | Extra headers |
|---|---|---|---|
| Epsilon | `epsilonBasicAuth` | `EPSILON_API_USERNAME_GAP` / `EPSILON_API_PASSWORD_GAP` or the `GAP_EAST` pair | Conditional `MasterUserAuth`, `CliUserAuth`, `CanUserAuth` |
| Bespoke / non-Epsilon | `bespokeBasicAuth` | `MATCHMAKER_*_USERNAME` / `MATCHMAKER_*_PASSWORD` selected by `matchmaker.api_setting.*` and legal entity | None |

The Epsilon adapter selects `GAP` or `GAP_EAST` credentials from
`matchmaker.epsilon.*`. Bespoke selects `default`, `gap_technical`, `gap_eu`,
`gap_east` or `dfr` credentials from `matchmaker.api_setting.*`; it sends only
its own `Authorization: Basic ...` header. The custom Epsilon token headers are
not part of Bespoke authentication.

The detailed mapping and wire formats are recorded in
[`matchmaker-api-docs.md`](matchmaker-api-docs.md), section 2.2. This repository
must not contain MatchMaker credentials, tokens, or private environment values.

## Security

Try it out is disabled by default because the browser would call MatchMaker
directly.

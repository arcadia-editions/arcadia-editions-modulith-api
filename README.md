# arcadia-editions-modulith-api

ZDL domain models for the Arcadia Editions modular monolith. Events are consumed
in-process with `@listener`; there is no AsyncAPI or Kafka contract in this
repository.

## Contents

- [zdl-annotations.md](./zdl-annotations.md): how `@listener` and `@asyncapi` are resolved by zenwave-sdk
- `*-domain-model.zdl`: one ZDL model per bounded context
- [.github/workflows/artifact-ci.yml](./.github/workflows/artifact-ci.yml): lint and validate declared ZDL artifacts
- [.github/workflows/artifact-release.yml](./.github/workflows/artifact-release.yml): package and publish a ZDL artifact or `service-all`

## Release identities

| Input `artifact` | Packages |
|---|---|
| `catalog-inventory-domain-model` | that ZDL file |
| `catalog-products-domain-model` | that ZDL file |
| `fulfillment-shipping-domain-model` | that ZDL file |
| `notifications-consumer-domain-model` | that ZDL file |
| `orders-checkout-domain-model` | that ZDL file |
| `payments-processing-domain-model` | that ZDL file |
| `service-all` | every tracked file in this repository |

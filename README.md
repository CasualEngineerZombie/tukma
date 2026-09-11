# Tukma

> A Go-native execution and coordination platform for reliable workloads, automation, and distributed systems.

**Tukma** is a long-term systems project for building a reusable execution platform in Go. It is designed to coordinate work, manage execution, and provide reliable infrastructure that can be reused across different applications and workloads.

AI workloads are one use case—not the definition of the platform.

## Status

🚧 Early development. The architecture is intentionally evolving as the project grows.

## Principles

- **Go-native** — use the standard library and simple primitives where they are the right tool.
- **Composable** — components should be useful independently and together.
- **Reliable by default** — cancellation, retries, timeouts, graceful shutdown, and observability are core concerns.
- **Understandable** — prefer explicit systems over unnecessary abstraction.
- **Reusable** — Tukma should become infrastructure that future projects can build on.

## Initial direction

```text
Clients / CLI
      │
      ▼
    API
      │
      ▼
 Coordination
      │
 ┌────┼──────────┐
 ▼    ▼          ▼
Queue Scheduler Events
      │
      ▼
 Execution Runtime
      │
 ┌────┼──────────┐
 ▼    ▼          ▼
Workers Tools  Workflows
```

This is a direction, not a commitment. Architecture will be documented through ADRs as the system develops.

## Repository layout

```text
cmd/                 Application entrypoints
internal/             Private application packages
  config/             Configuration
  runtime/            Execution runtime
  api/                HTTP API
  domain/             Core domain types
  storage/            Persistence abstractions
  queue/              Work coordination
  scheduler/          Scheduling
  events/             Execution events

docs/adr/             Architecture Decision Records
migrations/           Database migrations
.github/workflows/    CI
```

## Development

Requirements:

- Go 1.25+
- Make

Run the test suite:

```bash
make test
```

Run checks:

```bash
make check
```

## License

Tukma is currently private while the architecture and implementation are being developed.

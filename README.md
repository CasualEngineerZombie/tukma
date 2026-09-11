# Tukma

> A Go-native execution and coordination platform for reliable workloads, automation, and distributed systems.

Tukma is a Go-native execution platform for coordinating and running reliable workloads. It provides the foundation for workers, scheduling, workflows, events, and distributed execution, designed to power everything from automation and data pipelines to AI workloads.

## What is Tukma?

Modern applications often need to do more than handle HTTP requests. They need to run jobs, execute background work, trigger workflows, process events, schedule recurring tasks, call external services, and coordinate work across multiple workers.

Tukma is being built as the execution layer for those workloads.

The goal is to provide a set of simple, composable building blocks for taking work from **definition to execution** while handling the parts that become difficult as systems grow:

- Work scheduling
- Job execution
- Worker coordination
- Queues and delivery
- Workflow orchestration
- Event handling
- Retries and failure handling
- Timeouts and cancellation
- Concurrency and lifecycle management
- Persistence and state
- Observability
- External tool and service execution

Tukma is not limited to a single workload type. The same execution model can be used for automation, data pipelines, background jobs, integrations, webhooks, scheduled tasks, AI workloads, and other distributed workloads.

## Why Tukma?

A lot of application code eventually grows its own collection of background workers, cron jobs, queues, schedulers, retry logic, and ad-hoc execution code.

Tukma aims to provide a consistent execution model instead of rebuilding those pieces for every application.

The project focuses on keeping the core small and understandable while providing enough infrastructure to build more complex systems on top of it.

## Core ideas

### Work

A unit of work that needs to be executed. Work should have a clear lifecycle, identity, inputs, outputs, and execution state.

### Workers

Processes that execute work. Workers should be able to run concurrently, shut down gracefully, respond to cancellation, and report execution state.

### Scheduling

A way to decide when work should run. This will eventually cover delayed jobs, recurring schedules, and other scheduling strategies.

### Queues

A mechanism for moving work between producers and workers while providing control over concurrency, delivery, retries, and backpressure.

### Workflows

A way to compose multiple pieces of work into larger execution flows with dependencies, branching, retries, and state.

### Events

A way for components to communicate changes and execution results without tightly coupling every part of the system.

### Runtime

The execution layer responsible for managing work, workers, lifecycle, cancellation, concurrency, and the environment in which workloads run.

## Architecture direction

The initial architecture is intentionally modular. Components will be introduced when there is a real need for them instead of building a large distributed system on day one.

```text
                         Clients / CLI
                              │
                              ▼
                         HTTP / API
                              │
                              ▼
                         Coordination
                              │
              ┌───────────────┼───────────────┐
              ▼               ▼               ▼
           Queue          Scheduler         Events
              │               │               │
              └───────────────┼───────────────┘
                              ▼
                       Execution Runtime
                              │
                 ┌────────────┼────────────┐
                 ▼            ▼            ▼
              Workers       Tools       Workflows
                 │            │            │
                 └────────────┼────────────┘
                              ▼
                   External Services / Systems
```

This is the current direction, not a promise that every component will exist exactly as shown. The architecture will evolve through documented Architecture Decision Records in [`docs/adr`](docs/adr).

## Design principles

### Go first

Tukma is built in Go and will use the standard library wherever it provides a good solution. External dependencies should solve real problems rather than provide abstractions for their own sake.

### Simple systems are easier to operate

The project favors explicit control flow, small interfaces, clear ownership, and boring infrastructure over unnecessary abstraction.

### Concurrency is part of the design

Workloads are expected to run concurrently. Cancellation, deadlines, synchronization, worker lifecycle, backpressure, and graceful shutdown are treated as core system concerns.

### Failure is normal

Workers fail. Networks fail. Dependencies time out. Processes restart. Tukma will treat failure handling as part of normal execution rather than an afterthought.

### Composable components

Queues, workers, schedulers, workflows, events, and storage should have clear boundaries so they can evolve independently and be reused together.

### Observable execution

A system that runs work needs to make that work visible. Execution state, failures, latency, throughput, and resource usage should be observable as the platform develops.

### Earn the complexity

Tukma will not introduce distributed infrastructure simply because it is popular. Kafka, Kubernetes, service meshes, workflow engines, and other complex systems should only appear when the requirements justify them.

## Workloads

Tukma is intended to support workloads such as:

- Background jobs
- Scheduled tasks
- Data processing and ETL
- Automation
- Webhook processing
- External API integrations
- Long-running workers
- Multi-step workflows
- AI and LLM workloads
- Tool execution
- Distributed application tasks

AI is an important use case for Tukma, but it is not the boundary of the project. The underlying execution model is designed to be useful for ordinary software workloads as well.

## Project structure

```text
cmd/
└── tukma/                  Application entrypoint

internal/
├── api/                    HTTP/API layer
├── config/                 Configuration
├── domain/                 Core domain types
├── events/                 Execution events
├── queue/                  Work coordination
├── runtime/                Execution runtime
├── scheduler/              Scheduling
└── storage/                Persistence

docs/
└── adr/                    Architecture Decision Records

.github/
└── workflows/              GitHub Actions CI
```

The structure will change as the system grows. Packages should be created around real responsibilities rather than hypothetical future features.

## Development

### Requirements

- Go 1.25+
- Make
- Git

### Run

```bash
make run
```

### Build

```bash
make build
```

### Test

```bash
make test
```

### Race detector

```bash
make test-race
```

### Run all checks

```bash
make check
```

The CI workflow runs formatting checks, `go vet`, tests, and the Go race detector on pushes to `main` and pull requests.

## Current status

Tukma is in early development.

The repository currently contains the initial project structure, development tooling, CI, and the first architecture decision. The execution runtime and the individual coordination components will be built incrementally.

The project is intentionally being developed from the core execution model outward. The goal is to have a system that is useful and understandable before adding operational complexity.

## Roadmap

The roadmap is expected to evolve as implementation work exposes real requirements. The broad direction is:

1. Establish the core execution model
2. Build worker lifecycle and concurrency primitives
3. Add a basic HTTP API
4. Introduce persistent execution state
5. Add queue-based work distribution
6. Add scheduling
7. Add execution events and observability
8. Build workflow primitives
9. Add external tool and service execution
10. Explore distributed execution and multi-node operation
11. Improve operational tooling and the CLI
12. Support higher-level workloads such as AI agents and data pipelines

The order may change as the project develops.

## Architecture decisions

Important architectural decisions are recorded in [`docs/adr`](docs/adr).

Current ADRs:

- [ADR 0001: Initial Architecture Direction](docs/adr/0001-initial-architecture.md)

## Contributing

Tukma is being developed as an open-source project and contributions will be welcome as the APIs and architecture become more stable.

For now, the best way to contribute is to open an issue describing a problem, use case, or proposed change before starting a large implementation.

## License

Tukma is currently being prepared for public development. Licensing will be finalized before the first public release.

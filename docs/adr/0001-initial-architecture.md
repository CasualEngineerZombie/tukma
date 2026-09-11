# ADR 0001: Initial Architecture Direction

- **Status:** Accepted
- **Date:** 2026-09-11

## Context

Tukma is intended to become a reusable Go execution and coordination platform rather than a single-purpose AI application. The project will also serve as a long-term vehicle for developing production-level Go systems skills.

The architecture therefore needs to remain small and understandable while leaving room for scheduling, queues, workers, events, persistence, workflows, and AI workloads to grow independently.

## Decision

Tukma will begin as a modular Go application with:

- `cmd/` for executable entrypoints.
- `internal/` for implementation packages that are private to Tukma.
- `docs/adr/` for architecture decisions.
- `migrations/` for database migrations when persistence is introduced.
- `net/http` and the Go standard library as the initial foundation.
- Explicit interfaces only where they provide a real boundary between components.
- Context propagation for request cancellation, deadlines, and lifecycle control.
- Tests, race detection, formatting, and static analysis as part of normal development.

The initial conceptual flow is:

```text
Client / CLI
    |
    v
   API
    |
    v
Coordination
    |
    +--> Queue
    +--> Scheduler
    +--> Events
    |
    v
Execution Runtime
    |
    +--> Workers
    +--> Tools
    +--> Workflows
```

This diagram describes architectural direction, not a requirement to implement every component immediately.

## Consequences

### Positive

- Keeps the early system small enough to understand completely.
- Creates clear boundaries for future components.
- Makes Tukma reusable beyond AI workloads.
- Encourages incremental learning of Go systems engineering.

### Negative

- Some abstractions will likely change as real requirements emerge.
- Early components may be refactored rather than preserved for compatibility.
- Distributed-system features will be added only when their operational value is demonstrated.

## Non-goals for the initial phase

Tukma will not start with Kafka, Kubernetes operators, Temporal, a custom agent framework, or a large microservice topology. Complexity must be earned by actual requirements.

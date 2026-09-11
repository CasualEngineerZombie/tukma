# Contributing to Tukma

Thank you for your interest in contributing to Tukma! This document provides guidelines and information for contributors.

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to **[INSERT EMAIL]**.

## How to Contribute

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

When creating a bug report, include:

- A clear and descriptive title
- Steps to reproduce the behavior
- Expected behavior vs actual behavior
- Go version and OS information
- Any relevant logs or error messages

### Suggesting Features

Feature suggestions are welcome. Please open an issue with:

- A clear description of the proposed feature
- The motivation / use case
- How it fits within the project's design principles

### Your First Code Contribution

Unsure where to start? Look for issues labeled `good first issue` or `help wanted`.

### Pull Requests

1. Fork the repository
2. Create a feature branch from `main`
3. Make your changes
4. Add or update tests as needed
5. Ensure all checks pass
6. Submit a pull request

## Development Setup

### Prerequisites

- Go 1.25+
- Make
- Git

### Getting Started

```bash
# Clone the repository
git clone https://github.com/CasualEngineerZombie/tukma.git
cd tukma

# Build
make build

# Run
make run

# Run all checks (format, vet, test, race)
make check
```

## Development Workflow

### Branch Naming

- `feature/description` - for new features
- `fix/description` - for bug fixes
- `docs/description` - for documentation changes

### Commit Messages

Write clear, concise commit messages:

- Use the imperative mood ("Add feature" not "Added feature")
- Keep the first line under 72 characters
- Reference issue numbers when applicable

Examples:
```
Add worker lifecycle management

Implement graceful shutdown and cancellation support for workers.

Closes #42
```

### Code Style

- Follow standard Go conventions (`gofmt`, `go vet`)
- Keep functions small and focused
- Write meaningful variable and function names
- Add comments for non-obvious logic
- Prefer the standard library over external dependencies

### Testing

- Write tests for new functionality
- Ensure existing tests pass before submitting
- Use table-driven tests where appropriate
- Test edge cases and error conditions

```bash
# Run tests
make test

# Run tests with race detector
make test-race

# Run all checks
make check
```

### Architecture Decisions

Significant architectural changes should be proposed as Architecture Decision Records (ADRs) in `docs/adr/` before implementation. See the existing [ADR 0001](docs/adr/0001-initial-architecture.md) for the format.

## Pull Request Guidelines

- Keep PRs focused on a single change
- Include a clear description of what changed and why
- Link related issues
- Ensure CI passes
- Be responsive to review feedback

## Review Process

1. All submissions require review before merging
2. Maintainers may request changes or improvements
3. Once approved, a maintainer will merge the PR

## License

By contributing to Tukma, you agree that your contributions will be licensed under the [Apache License 2.0](LICENSE).

## Questions?

If you have questions about contributing, feel free to open an issue with the `question` label.

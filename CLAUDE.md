# Claude Code Instructions

> **Template Notice:** This file provides instructions for Claude Code when working on this project. After copying this template, replace this file with instructions specific to your project.

## Project Overview

This is a Go project using standard tooling and best practices.

## Development Environment

This project uses Nix for dependency management. Run `direnv allow` or `nix-shell` to enter the development environment with all required tools:

- Go 1.25
- golangci-lint
- goimports
- govulncheck

## Build System

Use `make help` to see all available targets. Key commands:

- `make all` - Run all checks and build (default)
- `make check` - Run fmt, lint, audit, and test
- `make lint` - Run golangci-lint
- `make test` - Run tests with race detector

The binary cannot be built without passing all quality checks (fmt, lint, audit, test).

## Code Style

- Follow standard Go conventions
- All code must pass golangci-lint with the project's configuration
- Use `goimports` for import formatting with local module grouping
- Run `make fmt` before committing

## Testing

- Write table-driven tests where appropriate
- Use `testify` for assertions (testifylint is enabled)
- Do not use testify suite
- Tests run with race detector enabled

## What to Update When Using This Template

After copying this template, update the following:

1. `go.mod` - Change module path from `example.com/myproject`
2. `Makefile` - Update `BINARY_NAME`, `MODULE`, and `DOCKER_IMAGE`
3. `Dockerfile` - Update module path in ldflags and binary name
4. `.golangci.yaml` - Update `local-prefixes` under goimports settings
5. `renovate.json` - Remove or adjust custom managers as needed
6. `README.md` - Replace with your project's documentation
7. `CLAUDE.md` - Replace with instructions specific to your project

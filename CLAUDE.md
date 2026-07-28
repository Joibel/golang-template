# Claude Code Instructions

> **Template Notice:** This file provides instructions for Claude Code when working on this project. After copying this template, replace this file with instructions specific to your project.

## Project Overview

This is a Go project using standard tooling and best practices.

## Development Environment

This project uses devenv (Nix) for dependency management, pinned to an exact `nixpkgs` revision in `devenv.yaml`. Run `direnv allow` or `devenv shell` to enter the development environment with all required tools:

- Go 1.26.5
- golangci-lint 2.12.2
- goimports

`govulncheck` is not part of the shell; `make audit` runs a pinned version via
`go run` so it is always built with the current Go toolchain.

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

<!-- gitnexus:start -->
# GitNexus — Code Intelligence

This project is indexed by GitNexus as **golang-template** (29 symbols, 20 relationships, 0 execution flows). Use the GitNexus MCP tools to understand code, assess impact, and navigate safely.

> If any GitNexus tool warns the index is stale, run `npx gitnexus analyze` in terminal first.

## Always Do

- **MUST run impact analysis before editing any symbol.** Before modifying a function, class, or method, run `gitnexus_impact({target: "symbolName", direction: "upstream"})` and report the blast radius (direct callers, affected processes, risk level) to the user.
- **MUST run `gitnexus_detect_changes()` before committing** to verify your changes only affect expected symbols and execution flows.
- **MUST warn the user** if impact analysis returns HIGH or CRITICAL risk before proceeding with edits.
- When exploring unfamiliar code, use `gitnexus_query({query: "concept"})` to find execution flows instead of grepping. It returns process-grouped results ranked by relevance.
- When you need full context on a specific symbol — callers, callees, which execution flows it participates in — use `gitnexus_context({name: "symbolName"})`.

## Never Do

- NEVER edit a function, class, or method without first running `gitnexus_impact` on it.
- NEVER ignore HIGH or CRITICAL risk warnings from impact analysis.
- NEVER rename symbols with find-and-replace — use `gitnexus_rename` which understands the call graph.
- NEVER commit changes without running `gitnexus_detect_changes()` to check affected scope.

## Resources

| Resource | Use for |
|----------|---------|
| `gitnexus://repo/golang-template/context` | Codebase overview, check index freshness |
| `gitnexus://repo/golang-template/clusters` | All functional areas |
| `gitnexus://repo/golang-template/processes` | All execution flows |
| `gitnexus://repo/golang-template/process/{name}` | Step-by-step execution trace |

## CLI

| Task | Read this skill file |
|------|---------------------|
| Understand architecture / "How does X work?" | `.claude/skills/gitnexus/gitnexus-exploring/SKILL.md` |
| Blast radius / "What breaks if I change X?" | `.claude/skills/gitnexus/gitnexus-impact-analysis/SKILL.md` |
| Trace bugs / "Why is X failing?" | `.claude/skills/gitnexus/gitnexus-debugging/SKILL.md` |
| Rename / extract / split / refactor | `.claude/skills/gitnexus/gitnexus-refactoring/SKILL.md` |
| Tools, resources, schema reference | `.claude/skills/gitnexus/gitnexus-guide/SKILL.md` |
| Index, status, clean, wiki CLI commands | `.claude/skills/gitnexus/gitnexus-cli/SKILL.md` |

<!-- gitnexus:end -->

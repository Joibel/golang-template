# Go Project Template

A template for Go projects with comprehensive linting, build automation, and modern tooling.

## Features

- **60+ linters** via golangci-lint v2 configuration
- **Nix-based development environment** for reproducible tooling
- **Makefile automation** with quality gates (build requires all checks to pass)
- **Docker support** with multi-stage distroless builds
- **GitHub Actions CI** with lint, test, build, and security audit
- **Renovate configuration** for automated dependency updates
- **Version embedding** via ldflags (version, commit, build time)

## Quick Start

1. Copy this template to your new project
2. Update the configuration (see [Configuration](#configuration) below)
3. Run `direnv allow` or `nix-shell` to enter the development environment
4. Run `make all` to verify everything works

## Requirements

- [Nix](https://nixos.org/download.html) package manager
- [direnv](https://direnv.net/) (optional, for automatic environment activation)

## Configuration

After copying this template, update the following files:

| File | What to Change |
|------|----------------|
| `go.mod` | Module path (`example.com/myproject` → your module) |
| `Makefile` | `BINARY_NAME`, `MODULE`, `DOCKER_IMAGE` |
| `Dockerfile` | Module path in ldflags, binary name |
| `.golangci.yaml` | `local-prefixes` under goimports settings |
| `renovate.json` | Adjust or remove custom managers |
| `README.md` | Replace with your project's documentation |
| `CLAUDE.md` | Replace with your project's AI assistant instructions |

## Make Targets

```
make all          Run all checks and build (default)
make check        Run all quality checks (fmt, lint, audit, test)
make lint         Run golangci-lint
make lint/fix     Auto-fix lint issues
make test         Run tests with race detector
make test/cover   Generate coverage report
make fmt          Format code
make vet          Run go vet
make audit        Run security and dependency checks
make deps         Download and tidy dependencies
make update       Update dependencies to latest versions
make docker       Build Docker image
make docker/push  Build and push multi-arch Docker image
make clean        Remove build artifacts
make help         Show all available targets
```

## Project Structure

```
.
├── .github/workflows/ci.yml  # GitHub Actions CI pipeline
├── .golangci.yaml            # Linter configuration (60+ linters)
├── internal/buildinfo/       # Build-time version info
├── Dockerfile                # Multi-stage distroless build
├── Makefile                  # Build automation
├── shell.nix                 # Nix development environment
├── .envrc                    # direnv configuration
├── renovate.json             # Dependency update automation
└── main.go                   # Application entry point
```

## Linting

The project uses golangci-lint v2 with 60+ linters enabled, including:

- **Core:** errcheck, govet, staticcheck, unused
- **Security:** gosec, bidichk
- **Error handling:** errorlint, wrapcheck, nilerr
- **Code quality:** revive (30+ rules), gocritic, unparam
- **Complexity:** gocyclo, gocognit, funlen, nestif
- **Bug prevention:** bodyclose, contextcheck, sqlclosecheck
- **Modernization:** modernize, intrange, exptostd

See `.golangci.yaml` for the complete configuration.

## CI Pipeline

The GitHub Actions workflow runs on push to main and pull requests:

1. **Lint** - golangci-lint
2. **Test** - with race detector and coverage
3. **Build** - produces binary artifact (requires lint + test to pass)
4. **Audit** - go mod verify and govulncheck

## License

Replace this section with your project's license.

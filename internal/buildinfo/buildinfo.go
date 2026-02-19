// Package buildinfo provides build-time version information.
package buildinfo

// Build-time variables (set via -ldflags).
var (
	Version   = "dev"
	Commit    = "unknown"
	BuildTime = "unknown"
)

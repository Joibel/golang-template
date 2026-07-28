{ pkgs, ... }:

{
  languages.go = {
    enable = true;
    package = pkgs.go_1_26;
  };

  packages = with pkgs; [
    gnumake
    golangci-lint
    gotools # goimports
  ];

  # govulncheck is deliberately not installed here: the packaged binary is
  # built against whichever Go it was compiled with and fails on newer
  # language versions. `make audit` runs a pinned version via `go run`.

  # Keep GOPATH outside the project. devenv would otherwise place it at
  # .devenv/state/go, putting the module cache inside the tree where
  # recursive tooling (gofmt, goimports, find) would walk into it.
  enterShell = ''
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"
  '';
}

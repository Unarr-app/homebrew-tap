# unarr Homebrew tap

Homebrew tap for [unarr](https://unarr.app) — the self-hosted media manager, player and debrid agent CLI.

## Install (macOS)

```sh
brew install unarr-app/tap/unarr
```

This installs the [cask](Casks/unarr.rb), which pulls the latest signed release from
[`Unarr-app/unarr-cli`](https://github.com/Unarr-app/unarr-cli). Casks are macOS-only —
on **Linux** install via `curl -fsSL https://unarr.app/install.sh | sh` or Docker.

## Update

```sh
brew upgrade --cask unarr
```

The cask is regenerated and committed automatically by goreleaser on every CLI release.

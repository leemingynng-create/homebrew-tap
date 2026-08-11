# Vocco Homebrew Tap

Official Homebrew tap for [Vocco](https://vocco.co) — on-device AI voice transcription and dictation for macOS (Apple Silicon, macOS 14+).

## Install

```sh
brew install --cask leemingynng-create/tap/vocco
```

## Upgrade

Vocco updates itself in-app via Sparkle, so `brew upgrade` skips it by default. To force-upgrade through Homebrew:

```sh
brew upgrade --cask --greedy vocco
```

## Uninstall

```sh
brew uninstall --cask vocco        # remove the app
brew uninstall --cask --zap vocco  # also remove local data (recordings, settings)
```

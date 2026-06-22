# Homebrew GlowKey

Homebrew tap for [GlowKey](https://github.com/aishuo07/GlowKey).

## Install

```sh
brew tap aishuo07/glowkey
brew trust aishuo07/glowkey
brew install --cask --no-quarantine glowkey
open /Applications/GlowKey.app
```

Homebrew 6 requires explicit trust for third-party taps.

GlowKey is currently unsigned. Use `--no-quarantine` until the app is Apple-notarized; otherwise macOS may show a misleading “damaged” warning.

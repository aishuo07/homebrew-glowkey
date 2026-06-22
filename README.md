# Homebrew GlowKey

Homebrew tap for [GlowKey](https://github.com/aishuo07/GlowKey).

## Install

```sh
brew tap aishuo07/glowkey
brew trust aishuo07/glowkey
brew install --cask glowkey
open /Applications/GlowKey.app
```

Homebrew 6 requires explicit trust for third-party taps.

GlowKey is currently unsigned. The cask clears Homebrew quarantine after install to avoid macOS showing a misleading “damaged” warning.

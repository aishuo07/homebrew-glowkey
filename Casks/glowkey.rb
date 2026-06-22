cask "glowkey" do
  version "0.1.2"
  sha256 "1dd0f2670fd6413e63e138d5de329180ff0a123863f9495cccbec3cc12582f56"

  url "https://github.com/aishuo07/GlowKey/releases/download/v#{version}/GlowKey-v#{version}-macos.zip"
  name "GlowKey"
  desc "Zero-config macOS external display brightness utility"
  homepage "https://github.com/aishuo07/GlowKey"

  app "GlowKey-v#{version}/GlowKey.app"

  caveats <<~EOS
    GlowKey is currently unsigned. Install with:

      brew install --cask --no-quarantine glowkey

    Without --no-quarantine, macOS may show a misleading "damaged" warning.
  EOS

  uninstall launchctl: [
              "fyi.glowkey.daemon",
            ],
            quit: [
              "fyi.glowkey.app",
            ],
            delete: [
              "~/bin/glowkey",
              "~/bin/lumensync",
            ]

  zap trash: [
    "~/Library/Application Support/GlowKey",
    "~/Library/LaunchAgents/fyi.glowkey.daemon.plist",
  ]
end

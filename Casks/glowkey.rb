cask "glowkey" do
  version "0.1.1"
  sha256 "ab92bb422c1df7febe17c60be0eb4254d3a7b07c9ccdf6b8bf273e6117e3d95e"

  url "https://github.com/aishuo07/GlowKey/releases/download/v#{version}/GlowKey-v#{version}-macos.zip"
  name "GlowKey"
  desc "Zero-config macOS external display brightness utility"
  homepage "https://github.com/aishuo07/GlowKey"

  app "GlowKey-v#{version}/GlowKey.app"

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

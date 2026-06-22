cask "glowkey" do
  version "0.1.0"
  sha256 "777851f57e3a5d87683b637a3cbfd4e656c7a03d71f26b5a0468a2d899c8b3ca"

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

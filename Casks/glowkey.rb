cask "glowkey" do
  version "0.1.2"
  sha256 "1dd0f2670fd6413e63e138d5de329180ff0a123863f9495cccbec3cc12582f56"

  url "https://github.com/aishuo07/GlowKey/releases/download/v#{version}/GlowKey-v#{version}-macos.zip"
  name "GlowKey"
  desc "Zero-config macOS external display brightness utility"
  homepage "https://github.com/aishuo07/GlowKey"

  app "GlowKey-v#{version}/GlowKey.app"

  postflight do
    system_command "/bin/sh",
                   args: [
                     "-c",
                     "find /Applications/GlowKey.app -exec xattr -d com.apple.quarantine {} \\; 2>/dev/null || true",
                   ]
  end

  caveats <<~EOS
    GlowKey is currently unsigned. This cask clears Homebrew quarantine after install
    to avoid macOS showing a misleading "damaged" warning.

    If macOS still blocks launch, run:

      find /Applications/GlowKey.app -exec xattr -d com.apple.quarantine {} \\; 2>/dev/null || true
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

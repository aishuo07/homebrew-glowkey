cask "glowkey" do
  version "0.1.3"
  sha256 "105ba97aa34494611909bc2e27066c79b801ff43959c0a2428f82bde49136ddd"

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

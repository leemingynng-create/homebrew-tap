# Vocco 的 Homebrew Cask。version/sha256 由 Vocco/scripts/release.sh 发版时自动改写，
# 改完需在本仓库 git commit + push 才对用户生效（DMG 先上线，tap 后推，避免 404）。
cask "vocco" do
  version "1.0.4"
  sha256 "15d1ba4bec3f4879155e5c87a7ea80f500d5fab7e092ca9f7f242dbaa79c33a8"

  url "https://vocco.co/updates/Vocco-#{version}.dmg"
  name "Vocco"
  desc "On-device AI voice transcription and dictation with speaker diarization"
  homepage "https://vocco.co/"

  livecheck do
    url "https://vocco.co/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Vocco.app"

  uninstall quit: "com.vocco.mac"

  zap trash: [
    "~/Library/Application Support/Vocco",
    "~/Library/Caches/com.vocco.mac",
    "~/Library/HTTPStorages/com.vocco.mac",
    "~/Library/Preferences/com.vocco.mac.plist",
    "~/Library/Saved Application State/com.vocco.mac.savedState",
  ]
end

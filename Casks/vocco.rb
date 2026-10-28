# Vocco 的 Homebrew Cask。version/sha256 由 Vocco/scripts/release.sh 发版时自动改写，
# 改完需在本仓库 git commit + push 才对用户生效（DMG 先上线，tap 后推，避免 404）。
cask "vocco" do
  version "1.0.8"
  sha256 "61124b9b950f7ced01d1c6809e825220ba91960c97dd8df10be2a8d590258f4e"

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

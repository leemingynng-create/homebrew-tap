# Vocco 的 Homebrew Cask。version/sha256 由 Vocco/scripts/release.sh 发版时自动改写，
# 改完需在本仓库 git commit + push 才对用户生效（DMG 先上线，tap 后推，避免 404）。
cask "vocco" do
  version "1.0.7"
  sha256 "dfeed56cdfd04071b9c82d8aae033159cfa8404da9ebeacc0899762bc3d9c5d3"

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

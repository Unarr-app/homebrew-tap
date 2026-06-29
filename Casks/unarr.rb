cask "unarr" do
  version "1.3.0-beta"

  on_arm do
    sha256 "03825ae1d09751d69f3f746f0e749df425904a96a36c1d8f7be4f871fed3d4cd"
    url "https://github.com/Unarr-app/unarr-cli/releases/download/v#{version}/unarr_#{version}_darwin_arm64.tar.gz"
  end
  on_intel do
    sha256 "13d5b44630f2a7f9a3d65a3d92bc06de8d427f2db1c9623ccdaa1cc042b7bbf5"
    url "https://github.com/Unarr-app/unarr-cli/releases/download/v#{version}/unarr_#{version}_darwin_amd64.tar.gz"
  end

  name "unarr"
  desc "Self-hosted media manager, player and debrid agent CLI"
  homepage "https://unarr.app"

  # unarr resolves the bundled ffmpeg/ffprobe as siblings of its own executable,
  # so only `unarr` is linked onto PATH; the rest stay in the Caskroom.
  binary "unarr"

  # The binary isn't notarized — strip the quarantine xattr from the staged dir
  # (covers unarr + the bundled ffmpeg/ffprobe) so Gatekeeper doesn't block it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}"]
  end
end

class Unarr < Formula
  desc "Self-hosted media manager, player and debrid agent CLI"
  homepage "https://unarr.app"
  version "1.3.0-beta"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Unarr-app/unarr-cli/releases/download/v1.3.0-beta/unarr_1.3.0-beta_darwin_arm64.tar.gz"
      sha256 "03825ae1d09751d69f3f746f0e749df425904a96a36c1d8f7be4f871fed3d4cd"
    end
    on_intel do
      url "https://github.com/Unarr-app/unarr-cli/releases/download/v1.3.0-beta/unarr_1.3.0-beta_darwin_amd64.tar.gz"
      sha256 "13d5b44630f2a7f9a3d65a3d92bc06de8d427f2db1c9623ccdaa1cc042b7bbf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Unarr-app/unarr-cli/releases/download/v1.3.0-beta/unarr_1.3.0-beta_linux_arm64.tar.gz"
      sha256 "6ba5d6343caca7253fabaaa42ff454dc0816f4a354206033ea9822e63fcb6c3b"
    end
    on_intel do
      url "https://github.com/Unarr-app/unarr-cli/releases/download/v1.3.0-beta/unarr_1.3.0-beta_linux_amd64.tar.gz"
      sha256 "9d01a9bb584f2ea3b1a01d893bc04185dc71ff8a6a1507e0b6f2a08cc1b9fa58"
    end
  end

  def install
    # Release tarball bundles unarr + its pinned ffmpeg/ffprobe. Keep them together
    # in libexec and expose only `unarr` on PATH (it resolves ffmpeg as a sibling).
    libexec.install "unarr", "ffmpeg", "ffprobe"
    bin.install_symlink libexec/"unarr"
  end

  test do
    assert_match "1.3.0-beta", shell_output("#{bin}/unarr version")
  end
end

# Retake 0.2.2. Written by scripts/brew-formula.sh in samahlstrom/retake; the release workflow replaces it on every release.
class Retake < Formula
  desc "Review videos by talking over them; your AI agent makes the next version"
  homepage "https://github.com/samahlstrom/retake"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/samahlstrom/retake/releases/download/v0.2.2/retake_0.2.2_darwin_arm64.tar.gz"
      sha256 "61a41e7d95e73baf4be3a4f6b2290c645aaef3659fc189b1801620231a39a6e9"
    end
    on_intel do
      url "https://github.com/samahlstrom/retake/releases/download/v0.2.2/retake_0.2.2_darwin_amd64.tar.gz"
      sha256 "17edaf1d7e9b542bd6af1259c20fb64043535b4b35259bfafc70ddf4774ee457"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/samahlstrom/retake/releases/download/v0.2.2/retake_0.2.2_linux_arm64.tar.gz"
      sha256 "2480a6824ef56729b3e79892f6f183fbc18fa55d0a85b8d1f5c69273e1bf6044"
    end
    on_intel do
      url "https://github.com/samahlstrom/retake/releases/download/v0.2.2/retake_0.2.2_linux_amd64.tar.gz"
      sha256 "80049312dbe4f41d3ea90912a161e6e51c52fc8756cc77946cbfcaa180c09553"
    end
  end

  def install
    # The release folder as it is: retake-bundle.json makes retake use the ffmpeg, herdr and retake-edit next to it.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"retake", libexec/"retake-edit"
  end

  def caveats
    <<~TEXT
      Start Retake with:
        retake
      It opens in your browser and walks you through setup.
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/retake --version")
    assert_match "libx264", shell_output("#{libexec}/ffmpeg -hide_banner -encoders")
  end
end

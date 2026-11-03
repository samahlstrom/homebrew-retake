# Retake 0.1.0. Written by scripts/brew-formula.sh in samahlstrom/retake; the release workflow replaces it on every release.
class Retake < Formula
  desc "Review videos by talking over them; your AI agent makes the next version"
  homepage "https://github.com/samahlstrom/retake"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/samahlstrom/retake/releases/download/v0.1.0/retake_0.1.0_darwin_arm64.tar.gz"
      sha256 "52815ebf81440a4e7da1d8d65e7a8f77d0f20bf2662cebd01e44e1967d2d098f"
    end
    on_intel do
      url "https://github.com/samahlstrom/retake/releases/download/v0.1.0/retake_0.1.0_darwin_amd64.tar.gz"
      sha256 "c587ef58a72c90fe83488f84deac21283bdccaeb34177667189b75b593f78afd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/samahlstrom/retake/releases/download/v0.1.0/retake_0.1.0_linux_arm64.tar.gz"
      sha256 "a5e2a93a0f077e71e4adb32aa854277f76e0e976a8f00d5f2657cdb73c278faa"
    end
    on_intel do
      url "https://github.com/samahlstrom/retake/releases/download/v0.1.0/retake_0.1.0_linux_amd64.tar.gz"
      sha256 "0ec995b73f7645311e72d73bdf1747a55ae1304ba03fe73af1e2c6c505524776"
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

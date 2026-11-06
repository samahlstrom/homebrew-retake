# Retake 0.2.3. Written by scripts/brew-formula.sh in samahlstrom/retake; the release workflow replaces it on every release.
class Retake < Formula
  desc "Review videos by talking over them; your AI agent makes the next version"
  homepage "https://github.com/samahlstrom/retake"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/samahlstrom/retake/releases/download/v0.2.3/retake_0.2.3_darwin_arm64.tar.gz"
      sha256 "f058bca90f998400ad22ddfa6a79ef5257853272ec12be1176fba8b492481e56"
    end
    on_intel do
      url "https://github.com/samahlstrom/retake/releases/download/v0.2.3/retake_0.2.3_darwin_amd64.tar.gz"
      sha256 "6ccb05899ce71d727329d246acde3d3bc02c0d850df91b61ee1bc7e0374cf6dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/samahlstrom/retake/releases/download/v0.2.3/retake_0.2.3_linux_arm64.tar.gz"
      sha256 "d70ba773f7a7bbc5eb8aa9640caa2ceb3d6abcd4dbd6dde3683d49dac3ca129d"
    end
    on_intel do
      url "https://github.com/samahlstrom/retake/releases/download/v0.2.3/retake_0.2.3_linux_amd64.tar.gz"
      sha256 "b887546c98c8f2a5c6aaef7b98d7f2f1c1a41f8fa81dedd876fb0b280b5b1bd1"
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

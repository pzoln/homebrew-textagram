class Tg < Formula
  desc "Text-based diagram editor for the terminal"
  homepage "https://textagram.md/"
  license "Apache-2.0"
  version "0.1.0-beta.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.9/tg-v0.1.0-beta.9-aarch64-apple-darwin.tar.gz"
      sha256 "ef1aacca6f3c108aa9050ac5ea7b54bc885eb935822f7792a63190edec268228"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.9/tg-v0.1.0-beta.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffdc4c386659b6f9da232dd37aca482d8a1ced043c1ed6f2e04a33b61098866a"
    end
  end

  def install
    bin.install "tg"
    prefix.install "README.md", "LICENSE"
  end

  test do
    assert_predicate bin/"tg", :exist?
    assert_predicate prefix/"README.md", :exist?
    assert_predicate prefix/"LICENSE", :exist?
  end
end

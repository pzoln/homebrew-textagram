class Tg < Formula
  desc "Text-based diagram editor for the terminal"
  homepage "https://textagram.md/"
  license "Apache-2.0"
  version "0.1.0-beta.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.2/tg-v0.1.0-beta.2-aarch64-apple-darwin.tar.gz"
      sha256 "778a6406f4049d2487bd4a3de75f13f0642f999a775f6b0665117e87fc79ff77"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.2/tg-v0.1.0-beta.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21f348abd9c2e4ebd5b86b5ea55ee160234809083cb051519f6f7082a94d6c7b"
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

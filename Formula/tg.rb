class Tg < Formula
  desc "Text-based diagram editor for the terminal"
  homepage "https://textagram.md/"
  license "Apache-2.0"
  version "0.1.0-alpha.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-alpha.6/tg-v0.1.0-alpha.6-aarch64-apple-darwin.tar.gz"
      sha256 "09e39b2bed93b39fb15f6373b515ab2ca10dd4a67472fe2dbce4251f326fe04e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-alpha.6/tg-v0.1.0-alpha.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "962f95152712310db7dfac44590510e5f7ccb5f94646d65be45c73b6fff0f49a"
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

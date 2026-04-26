class Tg < Formula
  desc "Text-based diagram editor for the terminal"
  homepage "https://textagram.md/"
  license "Apache-2.0"
  version "0.1.0-beta.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.1/tg-v0.1.0-beta.1-aarch64-apple-darwin.tar.gz"
      sha256 "c109d1f76ada37d2f0fd6e5029f5dbb3bb1aa2072a38356f8992a86fedea72c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.1/tg-v0.1.0-beta.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74ecea0aab9e1d30aa11b0add8e3596d12803ee1107dd195dd210dc7a3c81ba8"
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

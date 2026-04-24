class Tg < Formula
  desc "Text-based diagram editor for the terminal"
  homepage "https://textagram.md/"
  license "Apache-2.0"
  version "0.1.0-alpha.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-alpha.5/tg-v0.1.0-alpha.5-aarch64-apple-darwin.tar.gz"
      sha256 "f0332fc5cb56b98ecbb0b74d52fade72c6e3eb5aa1531197ebf2d10b5050a7cb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-alpha.5/tg-v0.1.0-alpha.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "196f62faf3de5af6c7d3871aff6e670c64938c8af09de3b0fd29f4cccdf32d92"
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

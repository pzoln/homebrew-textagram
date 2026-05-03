class Tg < Formula
  desc "Text-based diagram editor for the terminal"
  homepage "https://textagram.md/"
  license "Apache-2.0"
  version "0.1.0-beta.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.10/tg-v0.1.0-beta.10-aarch64-apple-darwin.tar.gz"
      sha256 "5530362e5bf486d5cd089a7fb85831fff1779aefbd1be4ee3d86fae7d8fc0dd3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.10/tg-v0.1.0-beta.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56c3e311f9eeca4dd23dbc7793117edf1460908267f50921c2377c91dfd364a5"
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

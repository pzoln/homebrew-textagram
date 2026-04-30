class Tg < Formula
  desc "Text-based diagram editor for the terminal"
  homepage "https://textagram.md/"
  license "Apache-2.0"
  version "0.1.0-beta.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.5/tg-v0.1.0-beta.5-aarch64-apple-darwin.tar.gz"
      sha256 "601bc65968c13c34754a602b7c186249540ed22889d29aef0fdd0e1bae92b6bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/pzoln/tg/releases/download/tg-v0.1.0-beta.5/tg-v0.1.0-beta.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59410b9acef042b61b3a7f9d2bb3f983966736e11c5598f9ac5a2b4069ae8b3d"
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

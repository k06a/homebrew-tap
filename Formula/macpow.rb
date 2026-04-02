class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "768f71c846a6904dc1832cf81537f3dc20f36135ff0116b16978f1d2f5742b50"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.13"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0f00d372ca52d018affc391e4d8e342706275730d166aa3d947f4b122005ccb0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a44380e24436a1bf083fe4e72f661bae2dcaf89d52e6bb0ef787e7f119d442ea"
  end

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "macpow", shell_output("#{bin}/macpow --help")
  end
end

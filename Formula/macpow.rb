class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.19.tar.gz"
  sha256 "3e98830ee2787f8fff0a131a124793dca3578a98f3d2d5c311b620d1f92c53d6"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.19"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0e8ac08bb1dbce47c08d13f0f63f713eca21dca8ac9b287065952bc599f9230b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d3aca9e27a94b29e7a12a07a3f7e6097b88f3378b91fdf6ad8fc0856ef5248b8"
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

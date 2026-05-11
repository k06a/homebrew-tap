class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.19.tar.gz"
  sha256 "3e98830ee2787f8fff0a131a124793dca3578a98f3d2d5c311b620d1f92c53d6"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.17"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b020998ccc6e6f6dba3fde5792798ae0c48b336a58b7d31746833a3b88aae5eb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6a4d39f214914303acd346d4cd7346c461fcd41a2589575c360d5a3a10ca9caa"
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

class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.17.tar.gz"
  sha256 "59d835fc276688b43bf389f97599a6372577c3804a73b1d3694dc841128a8108"
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

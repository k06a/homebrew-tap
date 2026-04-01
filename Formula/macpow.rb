class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.12.tar.gz"
  sha256 "be0d5c056bbfc0379a6886d66f9f3bda70886315a2688bd07f1f7a4df54af4db"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.12"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4e0ed2862978828908d67e6df3e72576c858798c00660b9de3d2d24d920317c1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d62e2a682af82681197d5f1f4bdeb8477ee754540bef8c6da8fd1d0b4dd49b9e"
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

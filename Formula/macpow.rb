class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "7225094c4529101f8b323dbeb71e7cb4f27a94e4a15ca8151f170acb2506e683"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos
  depends_on arch: :arm64

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "macpow", shell_output("#{bin}/macpow --help")
  end
end
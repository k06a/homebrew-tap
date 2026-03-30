class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "fc0f3d78b5420d78a39a37931c121fc32786fd7a933fa728e36ddc30aa687bfd"
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
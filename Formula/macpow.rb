class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "b7a6c9887f3e2f2c68c0398a6fc251862493d496516d4283b02b3ff057448c19"
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
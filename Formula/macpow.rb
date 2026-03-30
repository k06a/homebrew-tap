class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "04f5bf9c74fd4f82dc59f131a00f07c839159aaae7e696fbe8bb10b5d1de491c"
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
class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "0a639f23a20b492c5a54d68f78bd561abd8118b9e1af823b8b1c699124f7f72d"
  license "MIT"

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

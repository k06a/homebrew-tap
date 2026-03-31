class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "2a2f902d88d6b3743fd18f55dde499e388c3b24403c508c4cccf47aca22cc8b2"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "70f01e58c6b7444e35c2e6a0fd5622363361e8ab236a99d411d5e142d87eeacf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8c796a0fbcb1ddd0e3519d38e4e9659c591bca84718cad00cd13777e94b21f25"
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

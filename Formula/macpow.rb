class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.16.tar.gz"
  sha256 "04b2b59d3de0164175d64860e4c2d199cf19410c7c5d830f58253f41e4737674"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.16"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "9f909ebcd1dade8436c6aa01b6c9624529936484526ba0b1b659e567e61d5a1f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bd05081801bca552f4c4f2eafc2a39e9541e51401ece994d1d0180470e400d4c"
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

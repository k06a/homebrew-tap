class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.14.tar.gz"
  sha256 "6cdf2511a3272e2f8f23ee5290d7b1c4226b002c8e2ae561bd65743c854833db"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.14"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b8bf96af66a2e989727813632a2c6eb0a046b2d8d7b07e8363892b840ee824ef"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "db6ebafff91100710e723f60b7966895f73afb9bdecf6e522bce65c107b46ab8"
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

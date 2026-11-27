class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.20.tar.gz"
  sha256 "63cbe257c52ebbedc8a2252e6f050055573cb7c87277528233cd309805d7adc9"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.20"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b2e9b983a8ef4123f64f457f315b069ebe806299a6b29d7e49a902a5374373fd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "124019a9613a79307245a9e57dd592016d12c44650e2fb9139c4062bd5d51328"
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

class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.15.tar.gz"
  sha256 "90c016871373b7908adb3d57dd6b246e151ea9bc5e6adc25d5ad63aa3664d7af"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.15"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2f89965d4a4aa8ea3a299f51acb3a9ad6d60ff0a96720c830db1a53dbc7dc282"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f869d6e93ab33b893e93bcd3c824ea0d4ee5f27cb81d9cec049d95097e27546a"
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

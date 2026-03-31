class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "7a9b59f8ae019cf88f63db5660929f63899e671b7f6fb3619fe02b886c73903c"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.11"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "abaeac210324ff0e74b4f6989b2111c7a26bac472dcdd21a4f376da030b5487a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "871cf740ca358e51059fab1d8ff13aeb705e11d458881061587418bd89806a24"
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

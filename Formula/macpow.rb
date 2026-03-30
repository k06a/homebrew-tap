class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "eb9279d47f4ad40f5b85564034b1d55a2ad3524eff65c746ce0d017e53dbd986"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "69f574fbaa34a3ca367264ce17c858d3700afd368f58dc7b0660a67ecc76e515"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2b023bd20cc4cfe59c28decff17772e0fedc3f49b474dd6dcb6f64256617bab0"
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

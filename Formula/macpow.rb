class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "0a639f23a20b492c5a54d68f78bd561abd8118b9e1af823b8b1c699124f7f72d"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.10"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "36316685cb6bec3913c58dc95c987700615d2933e780b3a9a9b14e4ffa85f3a9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0a9c876307dbb595fe56909d0926d15bb24ed400d11ba9bdaa5242e865a6f647"
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

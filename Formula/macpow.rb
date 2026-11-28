class Macpow < Formula
  desc "Real-time power consumption monitor for Apple Silicon Macs"
  homepage "https://github.com/k06a/macpow"
  url "https://github.com/k06a/macpow/archive/refs/tags/v0.1.21.tar.gz"
  sha256 "572bb4a252e6c627d128615954e675e6b5a50da73bbc59299a24830e6e920f0a"
  license "MIT"

  bottle do
    root_url "https://github.com/k06a/homebrew-tap/releases/download/macpow-0.1.21"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "8d7ac6f058e8f87fdfa12c9461fad8edc62b67db638a7c5c09218b54e62978c5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c49d4a3df7ab31122dfcf288747e16743d89fcea4e82cb0e72ae1b423894b371"
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

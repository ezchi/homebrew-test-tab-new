class Gothanks < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/ezchi/homebrew-test-tab-new/releases/download/gothanks-0.3.0"
    sha256 cellar: :any_skip_relocation, ventura:      "ca769f0bb3906e67e6907021b7f99b8767553a22ea4158acece11eb2e03e7823"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "158e57974acbe20111ad5cb96ae6c95837dbf29821421c66fbee8c3a814f69af"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end

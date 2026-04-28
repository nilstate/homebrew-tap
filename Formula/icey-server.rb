class IceyServer < Formula
  desc "Self-hosted source-to-browser server built on icey"
  homepage "https://github.com/nilstate/icey-cli"
  url "https://github.com/nilstate/icey-cli/releases/download/v0.2.3/icey-cli-0.2.3-source.tar.gz"
  sha256 "52f3f9a77ead86e65ca8bbefd2b004176a53e8ff47a36361bd0c26fb2f32c117"
  license "AGPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "node" => :build
  depends_on "pkgconf" => :build
  depends_on "ffmpeg"
  depends_on "openssl@3"

  resource "icey" do
    url "https://github.com/nilstate/icey-cli/releases/download/v0.2.3/icey-2.4.9-source.tar.gz"
    sha256 "184eb5b2485c3350bb649b5a44b0891aa7e86403c7483670f1914ec604056ea2"
  end

  def install
    resource("icey").stage buildpath/"icey"

    system "npm", "--prefix", "web", "ci"
    system "npm", "--prefix", "web", "run", "build"
    system "cmake", "-S", ".", "-B", "build",
      "-DCMAKE_BUILD_TYPE=Release",
      "-DICEY_SOURCE_DIR=#{buildpath}/icey"
    system "cmake", "--build", "build", "-j1", "--target", "icey-server"
    system "cmake", "--install", "build", "--prefix", prefix, "--component", "apps"
  end

  test do
    assert_match "icey-server", shell_output("#{bin}/icey-server --version")
  end
end

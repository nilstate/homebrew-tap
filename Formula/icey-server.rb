class IceyServer < Formula
  desc "Self-hosted source-to-browser server built on icey"
  homepage "https://github.com/nilstate/icey-cli"
  url "https://github.com/nilstate/icey-cli/releases/download/v0.1.1/icey-cli-0.1.1-source.tar.gz"
  sha256 "ed4d2a448f15dd77b329b826f9518e149ee00caa58c3614e2a5369dc65896827"
  license "AGPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "node" => :build
  depends_on "pkgconf" => :build
  depends_on "ffmpeg"
  depends_on "openssl@3"

  resource "icey" do
    url "https://github.com/nilstate/icey-cli/releases/download/v0.1.1/icey-2.4.0-source.tar.gz"
    sha256 "45ca35b106123c58234c8e1e76dc60d91e666e25f47357e14f5fde9659cf1262"
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

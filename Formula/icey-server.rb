class IceyServer < Formula
  desc "Self-hosted source-to-browser server built on icey"
  homepage "https://github.com/nilstate/icey-cli"
  url "https://github.com/nilstate/icey-cli/releases/download/v0.1.1/icey-cli-0.1.1-source.tar.gz"
  sha256 "5e9d1a98c14071473d231ce4c590988ef9852137d85b29d1d467c82d6059dd67"
  license "AGPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "node" => :build
  depends_on "pkgconf" => :build
  depends_on "ffmpeg"
  depends_on "openssl@3"

  resource "icey" do
    url "https://github.com/nilstate/icey-cli/releases/download/v0.1.1/icey-2.4.1-source.tar.gz"
    sha256 "4a692202e2eec5ea45a2b49987c172ebccf691044b87fb9292911654c05d0ec9"
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

class IceyServer < Formula
  desc "Self-hosted source-to-browser server built on icey"
  homepage "https://github.com/nilstate/icey-cli"
  url "https://github.com/nilstate/icey-cli/releases/download/v0.2.2/icey-cli-0.2.2-source.tar.gz"
  sha256 "b84b3dfbd5f6ef61478379b42f4a2965092f31bddc83678ccc86932d8a9ab903"
  license "AGPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "node" => :build
  depends_on "pkgconf" => :build
  depends_on "ffmpeg"
  depends_on "openssl@3"

  resource "icey" do
    url "https://github.com/nilstate/icey-cli/releases/download/v0.2.2/icey-2.4.8-source.tar.gz"
    sha256 "d45557b5ef3cdda0e121ebda4689f80d6d0eb472a9f1e4c3ff2ce6c44d5aebfe"
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

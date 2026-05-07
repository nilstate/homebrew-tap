class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.0/scafld_2.3.0_darwin_arm64"
      sha256 "ab9534fbd2beae06e2817e39657ba7563a6963431b82df1e6cc5ac3b8cbeb40b"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.0/scafld_2.3.0_darwin_amd64"
      sha256 "034c69f378fedee72e42f3b9187e2e82489b6db18e6376d46fa899af6b4ff60e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.0/scafld_2.3.0_linux_arm64"
      sha256 "9aee839ca1645cf68b1eb114862d766191c66d2927a5c42a26942045149d1656"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.0/scafld_2.3.0_linux_amd64"
      sha256 "4caa84bc2eafeea169cac46959482bf613e4575d5edbecee24ee2a2a76e7a492"
    end
  end

  def install
    bin.install Dir["scafld_*"].first => "scafld"
    chmod 0755, bin/"scafld"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scafld --version")
  end
end

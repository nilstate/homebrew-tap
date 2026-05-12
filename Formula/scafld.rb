class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.9/scafld_2.3.9_darwin_arm64"
      sha256 "83a2d07c2e20860a46b93e800f2ef7e8bd31830e2c0ca94f7daa088c63e4f060"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.9/scafld_2.3.9_darwin_amd64"
      sha256 "2a281960985bfcbd29fb56e9eff2027be71312626cef61dc154865cb1e688e24"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.9/scafld_2.3.9_linux_arm64"
      sha256 "f6d3440e09af49dc65f5fda4e0d898b0578a6c705ca4942be58424cb5e5d54d4"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.9/scafld_2.3.9_linux_amd64"
      sha256 "af142a5635022b5e8c8bb75888d3ece22d0263b941d713f82409f92a80345128"
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

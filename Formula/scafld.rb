class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.12/scafld_2.3.12_darwin_arm64"
      sha256 "32ecfbfa56ae6f42df9d158a30ab4e960ff046cfeb081501191dc6f32ed6b451"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.12/scafld_2.3.12_darwin_amd64"
      sha256 "9955d971eb41151b306d3f8caac4a1e22c5e9a44a2b6bd0898eab8c96432ccd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.12/scafld_2.3.12_linux_arm64"
      sha256 "99d3d71b8b11577132e04398e1d3fe64ec7b1ec9d88cdd9eca0779e6480310d1"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.12/scafld_2.3.12_linux_amd64"
      sha256 "d85ce503c88773fba27694d902f900ff07a8fba3b3e0c2defe2d2fe4582c1b50"
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

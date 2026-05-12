class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.0/scafld_2.4.0_darwin_arm64"
      sha256 "1f9659995f3e94c51d738c3dd20c01a6579f8ef56270563a85b9f327274bfd8c"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.0/scafld_2.4.0_darwin_amd64"
      sha256 "8ae2204aabc3e1d5018637ea01da2b5e661cd41202d9ae895b21df5c34d57c01"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.0/scafld_2.4.0_linux_arm64"
      sha256 "8e191d431ed03d2a3d64b945ef99af1385bef226dc36b6dbdeb5bfc6156a1971"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.0/scafld_2.4.0_linux_amd64"
      sha256 "666903ad1425cb3f9e5118b1129fd56d7aa184e5c3ebef43a4dd4c0f14a56dcd"
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

class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.4/scafld_2.3.4_darwin_arm64"
      sha256 "1b8fc7c1e13efcffe861d629ea0832a245a6efeea6d1bde6a376c373cc44ec54"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.4/scafld_2.3.4_darwin_amd64"
      sha256 "1a72d0d5557d97f92f37ade906ab00355ba97d25e75bb81e48a25843ec11c4c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.4/scafld_2.3.4_linux_arm64"
      sha256 "e67a1193a1a2f4d70f0d60d1153f9444eae2aba94a91c04c88f3d4bd4bafac3f"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.4/scafld_2.3.4_linux_amd64"
      sha256 "69205c2f4ac76ffd41299e14ae81893680d0c369e9613801dd4581b8ced19881"
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

class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.8/scafld_2.3.8_darwin_arm64"
      sha256 "672c9703ecbfb5ea2eb222a291186aea6fc4edf90ecb32e7d0bc658f536b1ccd"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.8/scafld_2.3.8_darwin_amd64"
      sha256 "8f48dcb63b65e9bf81ee88dd7df1e5806fabfcd3a936352da6784d9719101126"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.8/scafld_2.3.8_linux_arm64"
      sha256 "7a8ca1e93fdbb757af762484f04f3c1daacc96db243abde8e53315779adb1a83"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.8/scafld_2.3.8_linux_amd64"
      sha256 "1044c251015526ebbd1a2c43aa95052d04e14a0bf3405d329e49d34e86007c79"
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

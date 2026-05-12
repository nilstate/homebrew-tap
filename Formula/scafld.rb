class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.11/scafld_2.3.11_darwin_arm64"
      sha256 "8f994ccdea1b34d1634c41471831b27634ae919766ff5a07de7dea92cd60f165"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.11/scafld_2.3.11_darwin_amd64"
      sha256 "2134112ff00ddea8290ba6aac79ebb2c6b84f43adc902b9e2791aa1ecb56fcbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.11/scafld_2.3.11_linux_arm64"
      sha256 "9fa0a61199aa3ffd67f688086037e41466cb874c8f2038f9ecb7ba0e47dc125e"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.11/scafld_2.3.11_linux_amd64"
      sha256 "d789e1862a719c5bcf94924a35c016b30b2c3cdf532423ec5a36c850bcde88c5"
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

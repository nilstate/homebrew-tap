class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.10/scafld_2.3.10_darwin_arm64"
      sha256 "dce9fa079aeff1f417b32bfb18ccb7f4911c72f2c96ecf560e1baf75067e0f99"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.10/scafld_2.3.10_darwin_amd64"
      sha256 "e07fa3fdec96d2abf8e1be01d9ee5b2e237e102fde62e95ecb284f04076585fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.10/scafld_2.3.10_linux_arm64"
      sha256 "73b3b59eb6338297c8160a5857e0bc02f4c021852e41c2a18b1ce8e53c1c6739"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.10/scafld_2.3.10_linux_amd64"
      sha256 "c93d42e82f2fe577ff877452cd7a38eb0093b4f6e98a454de4a185a464e0fedc"
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

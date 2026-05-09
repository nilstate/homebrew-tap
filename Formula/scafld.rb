class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.7/scafld_2.3.7_darwin_arm64"
      sha256 "dd7998bc49bbff0e26651c4444e917ad59898d252ecceaf243c68b7d188c5901"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.7/scafld_2.3.7_darwin_amd64"
      sha256 "fe2734a2a0f64d3249b3c61f55f2132354466feb180dc09381fb8673cc8a0ee8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.7/scafld_2.3.7_linux_arm64"
      sha256 "cdc88db7f9257328114cbd6926af8e5630fc677f8d88ee0c3f0c1a09f679f841"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.7/scafld_2.3.7_linux_amd64"
      sha256 "4921e152206b674f1c6dc72670c83be0c873544095c1b21c9462b9cef448b5f6"
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

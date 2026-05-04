class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.1.1/scafld_2.1.1_darwin_arm64"
      sha256 "de429cffda63ffffae52aa2d97a865bb712b2e698170d7034312cba73e6e23a0"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.1.1/scafld_2.1.1_darwin_amd64"
      sha256 "996d5b43f59b227be6f73804bf3ef6b1baf7f478787387ff677fa5c15a1a2588"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.1.1/scafld_2.1.1_linux_arm64"
      sha256 "dfda11d6dd7bb4ce34bf0a49466a68489d1ef3ee0b006ac7c4eb2ef5dc4590c5"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.1.1/scafld_2.1.1_linux_amd64"
      sha256 "57d126e6fed2f1e90bf2101d9c0ea6aaedb80c5f24b7c45666ca59c9eccab1bf"
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

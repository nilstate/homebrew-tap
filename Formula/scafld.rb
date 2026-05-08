class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.5/scafld_2.3.5_darwin_arm64"
      sha256 "c7288eb8af3c73127f8c2300fa34bd3324d7233fdcc2007b7910ef2b8c5da4dc"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.5/scafld_2.3.5_darwin_amd64"
      sha256 "b24150986ba23696f9e0f1cb45ed52e9b7163381a05279f17bf5cea9bd5b9059"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.5/scafld_2.3.5_linux_arm64"
      sha256 "b82955369bc8046ce7652f490c221aa1bf66d5e12a8be2484daf2f7aa467b38b"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.5/scafld_2.3.5_linux_amd64"
      sha256 "313d84da0bab57863315b98596b2ac5aef28fc5445f209fc6bf720937a867b9e"
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

class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.6/scafld_2.3.6_darwin_arm64"
      sha256 "558c4cb014063565c6356b289d49ee1136e4784b814768d652a8a368b0ae568f"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.6/scafld_2.3.6_darwin_amd64"
      sha256 "0431f38019f4f15926ee202360d82fda8561881f7d332649a483279072132deb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.6/scafld_2.3.6_linux_arm64"
      sha256 "9fbb2f05b684689c45e4f4488abf70d63b4b9a80744f5540fabfed08037aa880"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.6/scafld_2.3.6_linux_amd64"
      sha256 "8d5e16173e1d616a7069d4aacb79ce629169c6c9b91e9da7fde65961de040a06"
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

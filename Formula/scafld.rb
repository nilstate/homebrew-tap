class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.1/scafld_2.4.1_darwin_arm64"
      sha256 "267a01615d98e1d0a60321df86b4d91f9ecf56da3f0973e3dc7901bcb453143c"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.1/scafld_2.4.1_darwin_amd64"
      sha256 "eb9d5c89b60e353040d196d4e1ba1459c088dff11072ed54375dcc78c0f646e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.1/scafld_2.4.1_linux_arm64"
      sha256 "8f33c79010b63865263e562f487e46aa931fc2d6e86a09c77a6dc13dfa9b1446"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.1/scafld_2.4.1_linux_amd64"
      sha256 "8f4e4169246743e5028c4e4a3aee8c11d1f9151c4e29fa87de813a89f72547ef"
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

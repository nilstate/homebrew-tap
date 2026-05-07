class Scafld < Formula
  desc "Markdown-native task execution framework CLI"
  homepage "https://github.com/nilstate/scafld"
  version "2.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.1/scafld_2.3.1_darwin_arm64"
      sha256 "ba2c65dedc295531f00d38faf46a6d4bdecbda23b7eca1b5bd8f75e04c3834fd"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.1/scafld_2.3.1_darwin_amd64"
      sha256 "da6335d10c9958a129b91b5d3439334683c6bb7a8046f9b19eabbcf6a43c0620"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.3.1/scafld_2.3.1_linux_arm64"
      sha256 "c9952c017572b32df5057f1077121a7b9ef339e9d25c18ef4be61c9521b09321"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.3.1/scafld_2.3.1_linux_amd64"
      sha256 "52522c706a0e33b546f9c069c5e9a09f63996bd38e24facab864fb32bfa2173f"
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

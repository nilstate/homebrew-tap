class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.4/scafld_2.5.4_darwin_arm64"
      sha256 "29f75f79e25a40e20e7e497c778ae5af232b3bdf1968822d863855b3918b8136"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.4/scafld_2.5.4_darwin_amd64"
      sha256 "3ceff8a1f2730c543822522ad98e715ba33a6a26a77ba0765cd568ba7fb8cdb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.4/scafld_2.5.4_linux_arm64"
      sha256 "ee8d59487570dfe02b27bfcbb74150f504be368091de4444101402ededed8d8d"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.4/scafld_2.5.4_linux_amd64"
      sha256 "c93de4cfe6b7f5e248bdcd613a838eef74941bc927208b0853b8664109bbfcea"
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

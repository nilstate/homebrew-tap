class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.1/scafld_2.5.1_darwin_arm64"
      sha256 "730fb77c612eac5b8370065cc1188cd554b5f4b684d79f86695693d09ad057b4"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.1/scafld_2.5.1_darwin_amd64"
      sha256 "47f2e7e0156d166429d9def49bc924ba7e28baabcd32aabc9ef2636e6d6329fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.1/scafld_2.5.1_linux_arm64"
      sha256 "528fd09bd13b4afacd25d8f245a366b98f7f73de009a04ba8e8a5f7b94fd97c4"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.1/scafld_2.5.1_linux_amd64"
      sha256 "ac47f37eddf8e5516c1a5817b334dfb35a70dd790e5af9f9ebe508a60f557a80"
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

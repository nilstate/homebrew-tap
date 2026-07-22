class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.2/scafld_2.5.2_darwin_arm64"
      sha256 "2660df865a6f8eb484c0fd5646cb74701b0f6883ab040acda56dea29a2b90108"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.2/scafld_2.5.2_darwin_amd64"
      sha256 "4e7ec5a64a4db0cd9943aefeb2153729013932d391a015336f2bc5def37960a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.2/scafld_2.5.2_linux_arm64"
      sha256 "65e4ac2d1fef1cdf499de08d4592ec062c131c4bf88c56e88633ed533310ac22"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.2/scafld_2.5.2_linux_amd64"
      sha256 "a8aa09d43c7a30032c0b50f9c3d8290e9fdee3d0cc7b06e715d760588df50abc"
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

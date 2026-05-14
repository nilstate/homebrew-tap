class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.2/scafld_2.4.2_darwin_arm64"
      sha256 "a306bcec5de3ec582b618910444db1d8ad8b580b7330903806a9d936a328429a"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.2/scafld_2.4.2_darwin_amd64"
      sha256 "80355964202d9fc2731ece91a9d5438aff9bf7bc72938dd3d5b2a8f8b3ac81e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.2/scafld_2.4.2_linux_arm64"
      sha256 "36681a5f8aaeeb0fc48ed3c8d6c5400caa8f5b8f06f71b43401da8b9208bb5a7"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.2/scafld_2.4.2_linux_amd64"
      sha256 "a51c3d9c832b687ea4fe71b51c79e6b4d9f9d628fec8bfc78485e3668ece0328"
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

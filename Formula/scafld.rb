class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.4/scafld_2.4.4_darwin_arm64"
      sha256 "3da3da7f2f08dfd729a0b7d954f76f702eb6b77cd700c4dcac7cf8ad42eac624"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.4/scafld_2.4.4_darwin_amd64"
      sha256 "4ec231c5c3e5c7ca417d5d95c7b815af7f8424d89a2e02eac25dbe507f15b9d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.4/scafld_2.4.4_linux_arm64"
      sha256 "dd7fa56f906d341252a50e052f602fb2d372b9312e39c930d53610c7cffdd85d"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.4/scafld_2.4.4_linux_amd64"
      sha256 "5a6ca39c780f191795278afabb518aaf74c0d7bc4599a78048c2ef1aeea88f21"
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

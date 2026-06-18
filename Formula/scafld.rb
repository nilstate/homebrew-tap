class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.4.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.8/scafld_2.4.8_darwin_arm64"
      sha256 "f0cc9197d159a563454d5be10ced200844c09e12425ea972c64528c147b4f8e3"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.8/scafld_2.4.8_darwin_amd64"
      sha256 "1863a1eae8a9a50f4203fd76d828bfd293f6c1da7fe0ef4f8b0220bd65590887"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.8/scafld_2.4.8_linux_arm64"
      sha256 "d4b5b28eef59b32d90869e35b61f2fdf759d4a49f883ece486ceee2effd7cead"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.8/scafld_2.4.8_linux_amd64"
      sha256 "b8974a59c400560bd7035da61ffc88241d9d9e632d2030b4715a7443dd11d582"
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

class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.3/scafld_2.4.3_darwin_arm64"
      sha256 "ecd398c751e42db0941cf1c31a6e42cab0c40dca1523b17487d893a7e134c5ad"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.3/scafld_2.4.3_darwin_amd64"
      sha256 "c136432c218d1656e6bd6019f33cd1e3fecb0cc56dae1ec510cc6c89ed0586fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.3/scafld_2.4.3_linux_arm64"
      sha256 "76d7a638e4c1b5fd8006f29ea4ae984cee824208d0f9046dd8b99a92e19234c9"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.3/scafld_2.4.3_linux_amd64"
      sha256 "ad7f135007d0928a235fbded396ed2a375f14fc8aedf5d9264be67dd8990c62f"
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

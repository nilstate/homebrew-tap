class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.7/scafld_2.4.7_darwin_arm64"
      sha256 "9a3f372cc974e3d2eb24c47b163bbb3d18177185b7411ebdced4c4425961e005"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.7/scafld_2.4.7_darwin_amd64"
      sha256 "2f30b51372e656c4a44b089a6a578836a8ebc3bb54d50b16dd036e3e25aa7e41"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.7/scafld_2.4.7_linux_arm64"
      sha256 "c5610ab1a49fc5c3f7903982b7cfa967341eda1bde5f16eabcc65f9566122885"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.7/scafld_2.4.7_linux_amd64"
      sha256 "19a25fca64ba45e88d765df43da9572afb94f6751f1b5874df57481e4e027347"
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

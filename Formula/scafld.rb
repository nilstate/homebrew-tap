class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.7/scafld_2.5.7_darwin_arm64"
      sha256 "59d70e65fd8330249ca17e3fd113415c67c2008d116fd729fe0ea2c670eba84a"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.7/scafld_2.5.7_darwin_amd64"
      sha256 "db5264623f6782beef83ed2548bd37c2917ccc7150b1be073158b0a60dd605d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.7/scafld_2.5.7_linux_arm64"
      sha256 "4525dd5e0b5d95d0e6c12f0c2eeb525dd838526cab075ba8a5b9c8fe966a7c15"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.7/scafld_2.5.7_linux_amd64"
      sha256 "ddbf116e11ad90f06d23a6aeff378a9d2d3033284ce061ea9e489c1f4e348766"
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

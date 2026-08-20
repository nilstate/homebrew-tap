class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.6/scafld_2.5.6_darwin_arm64"
      sha256 "fc688aa3c11e3c5a8e09e329376efe1fb4d4fd4aea228ed8df2ed884a3db3c4a"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.6/scafld_2.5.6_darwin_amd64"
      sha256 "5ac63894c7eaabf994db8add3741419edcae4cb600725aadbbc99a45b10ab69f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.6/scafld_2.5.6_linux_arm64"
      sha256 "d637d8750efa3d411748573499626ac0c3c66a9443d69dbead26a9fd1e4116e4"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.6/scafld_2.5.6_linux_amd64"
      sha256 "3bfecc4e52c207744402b8ec08263900605e5477a1a84685efe400515101d912"
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

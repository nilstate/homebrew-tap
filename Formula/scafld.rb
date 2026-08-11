class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.5/scafld_2.5.5_darwin_arm64"
      sha256 "211df6ffc83167a4c4fde2c6fe67ba38ec64d073ae7bae3febbe05c85a2e2339"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.5/scafld_2.5.5_darwin_amd64"
      sha256 "2d481e22614d4044e09297a05a22f62a59f50e4b99065bebb48fdd1ae3633833"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.5/scafld_2.5.5_linux_arm64"
      sha256 "df73ffc0cba6c48ae17b40065006935ff5e9abc27e4cf4f30e67da38241399fb"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.5/scafld_2.5.5_linux_amd64"
      sha256 "73685c762c0d9120d98acd11b022e9c021cec9ecbd44e976b4dfcf3f5dfe575c"
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

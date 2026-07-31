class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.3/scafld_2.5.3_darwin_arm64"
      sha256 "7d902066af862bcee03454cdb3fb1c210e5c4146ec9dc0a64ec396e362ec34e6"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.3/scafld_2.5.3_darwin_amd64"
      sha256 "7535a2a41ddda44b2d2164512f00868d6bc0726ac2cf738e9e503449a5a7f04a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.3/scafld_2.5.3_linux_arm64"
      sha256 "90923ca685c69a8fe4790839eeaccaaadf2570669e6fcdd722f2bec07e2eeae2"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.3/scafld_2.5.3_linux_amd64"
      sha256 "63d30013ebc9bc224385a8ea9f36c6c5258ed52de9e343111f6c35ccf7bd0bc1"
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

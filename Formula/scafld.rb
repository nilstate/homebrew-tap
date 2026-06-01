class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.6/scafld_2.4.6_darwin_arm64"
      sha256 "803ebc8cde9da8ed81f000ae100e8dbe801e61e1bf8487381707f686e66f8b0e"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.6/scafld_2.4.6_darwin_amd64"
      sha256 "345ae699dfa0a4ee9941feb8e75136e001c4c732bded769030554cefd663a877"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.4.6/scafld_2.4.6_linux_arm64"
      sha256 "22ad708f81b03deaaac913c0145a03a0263ec1b42e42e2590542ef918967f4de"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.4.6/scafld_2.4.6_linux_amd64"
      sha256 "24f3b9e65e2f557a0a0a62d0210ed4abdf32930c003da190be31ba65db7d3c6d"
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

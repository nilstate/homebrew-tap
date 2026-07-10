class Scafld < Formula
  desc "Deterministic protocol for multi-phase agent work"
  homepage "https://0state.com/scafld"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.0/scafld_2.5.0_darwin_arm64"
      sha256 "67559bd93a05589b8c70a3330c222251d5290be47ab154d578e5296570a207d1"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.0/scafld_2.5.0_darwin_amd64"
      sha256 "d32a7643c7baf0f9d66bba4b1ce86b23ce280058880dfe766b3655b65fe75959"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nilstate/scafld/releases/download/v2.5.0/scafld_2.5.0_linux_arm64"
      sha256 "a3ff8f8c0e2f3ba93ab205cecbfc2274ce7702adb4791ed73f38fc001b9faa5d"
    else
      url "https://github.com/nilstate/scafld/releases/download/v2.5.0/scafld_2.5.0_linux_amd64"
      sha256 "a4f4ec26f45b0221aa10863d134e33cdafb0436772cb697ce3e58deab7dc6e0c"
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

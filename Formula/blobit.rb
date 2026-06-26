class Blobit < Formula
  desc "CLI for Blobit projects, assets, jobs, scenes, and publishing"
  homepage "https://www.blobit.ai"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Blobit-AI/homebrew-tap/releases/download/v0.1.5/blobit-v0.1.5-aarch64-apple-darwin.zip"
      sha256 "1202811bddfdf0b907d8588d5ab1d521ea2ef265f84477c635f7aaf30126dc4c"
    else
      url "https://github.com/Blobit-AI/homebrew-tap/releases/download/v0.1.5/blobit-v0.1.5-x86_64-apple-darwin.zip"
      sha256 "a7cea244e75458da9c4bc5559fe04ee353319ae7fa35cf7fd124e65afff173b2"
    end
  end

  on_linux do
    depends_on "dbus"

    url "https://github.com/Blobit-AI/homebrew-tap/releases/download/v0.1.5/blobit-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "51431a2f2d1a392e43fb823084618574190ce684f422f6da690e5f11397173f3"
  end

  def install
    bin.install "blobit"
  end

  def caveats
    <<~EOS
      Blobit is recommended with the Blobit CLI Skill Pack for Codex game asset workflows.

      To install it, run:
        blobit codex setup

      Or run the Codex commands directly:
        codex plugin marketplace add Blobit-AI/blobit-cli-skill-pack
        codex plugin add blobit-cli-skill-pack@blobit-cli-skill-pack
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/blobit --help")
  end
end

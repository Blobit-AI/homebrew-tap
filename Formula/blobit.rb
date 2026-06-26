class Blobit < Formula
  desc "CLI for Blobit projects, assets, jobs, scenes, and publishing"
  homepage "https://www.blobit.ai"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.5/blobit-v0.1.5-aarch64-apple-darwin.zip"
      sha256 "4f3652be393bd7dc35d84414d5b7efdbeb983897327bf95004a6d16c35bbc6ec"
    else
      url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.5/blobit-v0.1.5-x86_64-apple-darwin.zip"
      sha256 "557c8155306cab82c9888647f72c3a930badc9e594bb60a4b24f7b1adcee307e"
    end
  end

  on_linux do
    depends_on "dbus"

    url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.5/blobit-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4c5e0275545507803ff27629507cb1bcee2541973932f34ae11bdc170142619c"
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

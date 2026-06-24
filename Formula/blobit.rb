class Blobit < Formula
  desc "CLI for Blobit projects, assets, jobs, scenes, and publishing"
  homepage "https://www.blobit.ai"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.3/blobit-v0.1.3-aarch64-apple-darwin.zip"
      sha256 "5fe5165ce092e27f68928766df2934a42412f9ab60d360a2db731b766c8c33e3"
    else
      url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.3/blobit-v0.1.3-x86_64-apple-darwin.zip"
      sha256 "0ac6591dc44f17cf43b4673c0502cd6a1205ec01a276769a145b2f1e485068c1"
    end
  end

  on_linux do
    depends_on "dbus"

    url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.3/blobit-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e94a5dbc53706ec29f1f735fa5862203c05885395c0b8b3198e54f50049c49f4"
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
        codex plugin marketplace add 3dMVP/blobit-cli-skill-pack
        codex plugin add blobit-cli-skill-pack@blobit-cli-skill-pack
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/blobit --help")
  end
end

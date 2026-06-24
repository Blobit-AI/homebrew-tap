class Blobit < Formula
  desc "CLI for Blobit projects, assets, jobs, scenes, and publishing"
  homepage "https://www.blobit.ai"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.4/blobit-v0.1.4-aarch64-apple-darwin.zip"
      sha256 "245a958c32a002ae1b6ec0728e42eb206dbd947d277a316cc49e59c0939b8d73"
    else
      url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.4/blobit-v0.1.4-x86_64-apple-darwin.zip"
      sha256 "991e23c31074609f37609bb45cb801f28ea7f7e2f429bf077723543de8f7358f"
    end
  end

  on_linux do
    depends_on "dbus"

    url "https://github.com/3dMVP/homebrew-tap/releases/download/v0.1.4/blobit-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8eb08eda9f3537f5203320dd02216a1b293c8d566192cbe9695bbadc1975b31a"
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

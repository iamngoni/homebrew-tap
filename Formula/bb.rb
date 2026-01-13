class Bb < Formula
  desc "Modern CLI for Bitbucket Cloud and Server/Data Center"
  homepage "https://github.com/iamngoni/bitbucket-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-aarch64.tar.gz"
      sha256 "Not"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-x86_64.tar.gz"
      sha256 "Not"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-aarch64.tar.gz"
      sha256 "Not"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-x86_64.tar.gz"
      sha256 "Not"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "bb-darwin-aarch64" => "bb"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "bb-darwin-x86_64" => "bb"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "bb-linux-aarch64" => "bb"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "bb-linux-x86_64" => "bb"
    end
  end

  test do
    system "#{bin}/bb", "--version"
  end
end

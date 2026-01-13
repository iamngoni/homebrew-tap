class Bb < Formula
  desc "Modern CLI for Bitbucket Cloud and Server/Data Center"
  homepage "https://github.com/iamngoni/bitbucket-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-aarch64.tar.gz"
      sha256 "32facff8951cebac722ea7dc50ebb575104047dd4aa55ac0066eae8081a862b9"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-x86_64.tar.gz"
      sha256 "c5b9e248e49dbe87c182820c6393ace81e556b85d8e6f383983c2c4aa03f3572"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-aarch64.tar.gz"
      sha256 "baa14cc6a4ed77e77d095d507605cbceb3f0432461deaf6bf6dd362ceae4ec82"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-x86_64.tar.gz"
      sha256 "c5c97f18c463a8111ad84e69a7c5dc5c833248ede1f83dceea73ce093bf08dde"
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

class Bb < Formula
  desc "Modern CLI for Bitbucket Cloud and Server/Data Center"
  homepage "https://github.com/iamngoni/bitbucket-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-aarch64.tar.gz"
      sha256 "f628585f69d1487f53fcd0bfe280c800fc007ac4927d2f800fb9fefefe3cc571"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-x86_64.tar.gz"
      sha256 "efdf04b889f1183b1d7efabb98008f6636ab2fcc6ba8195a335e5e1a0eb20e46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-aarch64.tar.gz"
      sha256 "bb88514ce1e8c176f7e258cba7ba34b5a92c513dbacc7970dc2e20d26502eece"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-x86_64.tar.gz"
      sha256 "09556cc60e777894d83697bd18e285305ae00e0103bd20a1c2e5f1bfa964aaf8"
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

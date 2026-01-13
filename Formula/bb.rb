class Bb < Formula
  desc "Modern CLI for Bitbucket Cloud and Server/Data Center"
  homepage "https://github.com/iamngoni/bitbucket-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-aarch64.tar.gz"
      sha256 "69475a4a0123f343d4ff1d0e1d3b5fece08b27f0458554e47c3f1f302deeb6b8"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-x86_64.tar.gz"
      sha256 "3af84fe6b9f8807260e08dcd91251e7168410c6a36e5e9cb191626158cd0e2b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-aarch64.tar.gz"
      sha256 "4b2b0977d3feea5bf66707eca42a30634a83e976021b47b42b701e6780d50d84"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-x86_64.tar.gz"
      sha256 "c9d4a693d4c96e58e5a41b13b76369e51315a1a261aad49a3e459707a5bd7a9a"
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

class Bb < Formula
  desc "Modern CLI for Bitbucket Cloud and Server/Data Center"
  homepage "https://github.com/iamngoni/bitbucket-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.2.0/bb-darwin-aarch64.tar.gz"
      sha256 "b7d7bc0943579c74393afd01365de210fef4e622d81f04a3ba39b51e5031dd60"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.2.0/bb-darwin-x86_64.tar.gz"
      sha256 "1d6c2b376b269ac2250332672355100c779ba62205dbf5cfde8debdc612d79f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.2.0/bb-linux-aarch64.tar.gz"
      sha256 "089ce42fbf6f259979e7d2cb7f4a7cb75d85a7118dc7c9714cba40baacee7b2d"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.2.0/bb-linux-x86_64.tar.gz"
      sha256 "a0dbb3498cd1506d1d8c762fa07f8b94d2f480a8ed89c92b24fb709bcf6f0379"
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

class Bb < Formula
  desc "Modern CLI for Bitbucket Cloud and Server/Data Center"
  homepage "https://github.com/iamngoni/bitbucket-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-aarch64.tar.gz"
      sha256 "4a074f6f695ccf7c0674fc1ce8b76d733a11dce855100e970bc89303ae245432"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-darwin-x86_64.tar.gz"
      sha256 "3d673ad7d459cffa244e51a54345ff53c865db7043938d79ee6bf194c274c3f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-aarch64.tar.gz"
      sha256 "730c11df1df42836dbf126d7d5cbdcad2109a57d8ffde4aa78485661f6f9b97e"
    end
    on_intel do
      url "https://github.com/iamngoni/bitbucket-cli/releases/download/v0.1.0/bb-linux-x86_64.tar.gz"
      sha256 "a680ad71770cfca7009a925945c9d120529d45b26855e9d9a766788aa76d2fca"
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

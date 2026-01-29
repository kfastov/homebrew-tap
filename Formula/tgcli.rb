class Tgcli < Formula
  desc "Telegram CLI + MCP server"
  homepage "https://github.com/kfastov/telegram-mcp-server"
  url "https://registry.npmjs.org/@kfastov/tgcli/-/tgcli-2.0.0.tgz"
  sha256 "ae33c7520fd34ea023ecdb87ead53233ac0f47da294af2b852b4783280dd48f2"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--global", "--prefix", libexec, buildpath
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/tgcli", "--version"
  end
end

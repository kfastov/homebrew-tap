class Tgcli < Formula
  desc "Telegram CLI + MCP server"
  homepage "https://github.com/kfastov/telegram-mcp-server"
  url "https://registry.npmjs.org/@kfastov/tgcli/-/tgcli-2.0.2.tgz"
  sha256 "5df41c0b06df18c5da9a7740e05fa9eb3a179c36f54cb8d19f27cbaf161a9a7a"
  license "MIT"

  depends_on "node@22"

  def install
    system Formula["node@22"].opt_bin/"npm", "install", "--global", "--prefix", libexec, cached_download
    (bin/"tgcli").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node@22"].opt_bin}/node" "#{libexec}/lib/node_modules/@kfastov/tgcli/cli.js" "$@"
    EOS
  end

  test do
    system "#{bin}/tgcli", "--version"
  end
end

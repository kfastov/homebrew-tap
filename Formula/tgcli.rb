class Tgcli < Formula
  desc "Telegram CLI + MCP server"
  homepage "https://github.com/kfastov/telegram-mcp-server"
  url "https://registry.npmjs.org/@kfastov/tgcli/-/tgcli-2.0.6.tgz"
  sha256 "103524c5a287a2694cb2175a81591f75840b01ffa617c9f0345b5c850800a163"
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

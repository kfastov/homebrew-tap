class Tgcli < Formula
  desc "Telegram CLI + MCP server"
  homepage "https://github.com/kfastov/telegram-mcp-server"
  url "https://registry.npmjs.org/@kfastov/tgcli/-/tgcli-2.0.7.tgz"
  sha256 "423f1fb0f23f90fdff385b13c4d80488285604e1a5b03e613d35fafc6f9c90c0"
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

class Tgcli < Formula
  desc "Telegram CLI + MCP server"
  homepage "https://github.com/kfastov/tgcli"
  url "https://registry.npmjs.org/@kfastov/tgcli/-/tgcli-2.2.2.tgz"
  sha256 "4000e9a6aae5215d44ca81f47d0c2a8a6647295c920e896520da3089540c63b2"
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

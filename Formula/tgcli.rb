class Tgcli < Formula
  desc "Telegram CLI + MCP server"
  homepage "https://github.com/kfastov/tgcli"
  url "https://registry.npmjs.org/@kfastov/tgcli/-/tgcli-2.2.4.tgz"
  sha256 "1f6166fad1832e49a69b44b24ca0ca361d09ad69175ee7df04d2e7c01d97fc30"
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

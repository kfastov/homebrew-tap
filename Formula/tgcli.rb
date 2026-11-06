class Tgcli < Formula
  desc "Telegram CLI + MCP server"
  homepage "https://github.com/kfastov/tgcli"
  url "https://registry.npmjs.org/@kfastov/tgcli/-/tgcli-2.2.5.tgz"
  sha256 "aff76dcd460b40f956780139823a5e746708856850698c754f1d0b36d38cc5b5"
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

class Tgcli < Formula
  desc "Telegram CLI + MCP server"
  homepage "https://github.com/kfastov/tgcli"
  url "https://registry.npmjs.org/@kfastov/tgcli/-/tgcli-2.3.0.tgz"
  sha256 "d8f4d42d086a4f77a4d7c7fb504c1d15b3821bec0f89dd9f021ecb2e0c99bebc"
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

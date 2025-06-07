class Wsc < Formula
  desc "WebSocket Client - 企业级高性能WebSocket客户端命令行工具"
  homepage "https://github.com/LOVECHEN/WebSocket-Client"
  version "2025.06.07-c8ce044"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/WebSocket-Client/releases/download/v2025.06.07-c8ce044/wsc_darwin_arm64.zip"
      sha256 "a73e3e55418ec5740bc42cdf2097cf6efbf9d735f7654d5222e5c71822ed4b10"
    else
      url "https://github.com/LOVECHEN/WebSocket-Client/releases/download/v2025.06.07-c8ce044/wsc_darwin_amd64.zip"
      sha256 "c5f5df1fbedf1f707d6b931bb4fd919b806099490c5572585aac814a2756c644"
    end
  else
    odie "仅支持 macOS 系统"
  end

  def install
    bin.install "wsc"
  end

  test do
    system "#{bin}/wsc", "--version"
  end
end

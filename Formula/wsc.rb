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
    # 处理不同的二进制文件命名模式
    if Hardware::CPU.arm?
      # ARM64 版本可能的文件名
      candidates = ["wsc", "wsc_darwin_arm64", "wsc_macos_arm64"]
    else
      # AMD64 版本可能的文件名
      candidates = ["wsc", "wsc_darwin_amd64", "wsc_darwin_x86_64", "wsc_macos_amd64", "wsc_macos_x86_64"]
    end

    # 查找实际存在的文件并安装
    installed = false
    candidates.each do |candidate|
      if File.exist?(candidate)
        bin.install candidate => "wsc"
        installed = true
        break
      end
    end

    unless installed
      odie "找不到二进制文件。尝试的文件名: #{candidates.join(', ')}"
    end
  end

  test do
    system "#{bin}/wsc", "--version"
  end
end

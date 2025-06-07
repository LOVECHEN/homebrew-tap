class Wsc < Formula
  desc "WebSocket Client - 企业级高性能WebSocket客户端命令行工具"
  homepage "https://github.com/LOVECHEN/WebSocket-Client"
  version "2025.06.07-e648414"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/WebSocket-Client/releases/download/v2025.06.07-e648414/wsc_darwin_arm64.zip"
      sha256 "42eaec9acf82bcf1d2924a8e1a40e3161d5f9e6f0612aef9dbb80ced1f395e0d"
    else
      url "https://github.com/LOVECHEN/WebSocket-Client/releases/download/v2025.06.07-e648414/wsc_darwin_amd64.zip"
      sha256 "62c446d8c696dab5f9d834fd19ea74acd622737d6c26aa6845b58811e83d324f"
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

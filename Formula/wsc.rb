class Wsc < Formula
  desc "WebSocket Client - 企业级高性能WebSocket客户端命令行工具"
  homepage "https://github.com/LOVECHEN/WebSocket-Client"
  version "2025.06.07-e0e32d9"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/WebSocket-Client/releases/download/v2025.06.07-e0e32d9/wsc_darwin_arm64.zip"
      sha256 "e4f58e5326b2eca587222a1bdda2ec1ccc4e97b5c7a2700b4f60d90dab5d2586"
    else
      url "https://github.com/LOVECHEN/WebSocket-Client/releases/download/v2025.06.07-e0e32d9/wsc_darwin_amd64.zip"
      sha256 "f22bf6dba2bc91837b16640d9039db9b24f26e7f975b0c6576d46b6cf28698a6"
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

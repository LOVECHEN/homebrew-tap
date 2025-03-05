class Grd < Formula
  desc "Github Release Downloader - A command line tool for downloading GitHub release files"
  homepage "https://github.com/LOVECHEN/github-release-downloader"
  version "25.03.06"
  
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.03.06/grd_darwin_arm64.tar.gz"
      sha256 "a358d0aa642d5afe73b60a1d12c237f6b6bdae8896202b05ec4422b0ffcf5236"
    else
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.03.06/grd_darwin_x86_64.tar.gz"
      sha256 ""
    end
  else
    odie "仅支持 macOS 系统"
  end
  
  def install
    bin.install "grd"
  end
  
  test do
    system "#{bin}/grd", "--version"
  end
end

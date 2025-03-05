class Grd < Formula
  desc "Github Release Downloader - A command line tool for downloading GitHub release files"
  homepage "https://github.com/LOVECHEN/github-release-downloader"
  version "25.03.06"
  
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.03.06/grd_darwin_arm64.tar.gz"
      sha256 "b2a661028b51be92825c015737f467af4bd44b336155894dcd472ce2f220b27c"
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

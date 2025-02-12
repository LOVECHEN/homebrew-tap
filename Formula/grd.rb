class Grd < Formula
  desc "Github Release Downloader - A command line tool for downloading GitHub release files"
  homepage "https://github.com/LOVECHEN/github-release-downloader"
  version "25.02.13"
  
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.13/grd_darwin_arm64.tar.gz"
      sha256 "8189e803441a9cc214521d38f7a77cc8d1b69e8951933112ad2a7851903aec74"
    else
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.13/grd_darwin_x86_64.tar.gz"
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

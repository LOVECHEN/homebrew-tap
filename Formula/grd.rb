class Grd < Formula
  desc "Github Release Downloader - A command line tool for downloading GitHub release files"
  homepage "https://github.com/LOVECHEN/github-release-downloader"
  version "25.02.11"
  
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.11/grd_darwin_arm64.tar.gz"
      sha256 "48d8b157c93dfac0db162f339cd7eae5da48b9ad684e0a11f61bd75ac3b7a9ec"
    else
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.11/grd_darwin_x86_64.tar.gz"
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

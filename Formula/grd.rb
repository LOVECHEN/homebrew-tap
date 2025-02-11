class Grd < Formula
  desc "Github Release Downloader - A command line tool for downloading GitHub release files"
  homepage "https://github.com/LOVECHEN/github-release-downloader"
  version "25.02.11"
  
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.11/grd_darwin_arm64.tar.gz"
      sha256         "bec551732ab6736e7b5eae2ff9f0168281006426e02d91ad4606238e209361cf"
    else
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.11/grd_darwin_x86_64.tar.gz"
      sha256         "1b78a11f60f05ea785f9ccbe3d62e1873abc6b4c73dd0ecd3bb0678e5238b5c3"
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

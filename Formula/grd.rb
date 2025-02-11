class Grd < Formula
  desc "Github Release Downloader - A command line tool for downloading GitHub release files"
  homepage "https://github.com/LOVECHEN/github-release-downloader"
  version "25.02.11"
  
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.11/grd_darwin_arm64.tar.gz"
      sha256 "776b965cf7b448dd71cc88c05e3375b6f5ad871b07ab23b0050f792467f217df"
    else
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.11/grd_darwin_x86_64.tar.gz"
      sha256 "5445ef9fc8ecc54a20da3fca27d3adf4bf3aedaa37479272ee50072e40015916"
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

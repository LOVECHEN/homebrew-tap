class Grd < Formula
  desc "Github Release Downloader - A command line tool for downloading GitHub release files"
  homepage "https://github.com/LOVECHEN/github-release-downloader"
  version "25.02.11"
  
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.11/grd_darwin_arm64.tar.gz"
      sha256         "82492ebd1b474a48019819b60bf646185b30d07bfbbfe7a7a69245ff7fed4509"
    else
      url "https://github.com/LOVECHEN/github-release-downloader/releases/download/v25.02.11/grd_darwin_x86_64.tar.gz"
      sha256         "9ed2097e08974a00babed3adc382539ebfb82a3d4d4fe0ea6805a42af3495da8"
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

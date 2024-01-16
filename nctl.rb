require "formula"
require "download_strategy"

class Nctl < Formula
  desc ""
  homepage "https://github.com/nirmata/go-nctl"
  version "0.0.0"
  depends_on :macos

  on_macos do
    url "https://github.com/nirmata/go-nctl/releases/download/v0.0.0/nctl_0.0.0_darwin_all.tar.gz", :using => DownloadStrategy
    sha256 "2d9843a781152a32d9544118cb7fb50dd430c51bf6afc731d982e35e8581d7bc"

    def install
      bin.install "nctl"
    end
  end
end


class DownloadStrategy < CurlDownloadStrategy
  def fetch(timeout: nil, **options)
    super
    unzip
  end
  def extname
    ".zip"
  end

def unzip
  ohai "Unzipping the downloaded file..."
  system "unzip", "-q", cached_location, "-d", temporary_path
end

end


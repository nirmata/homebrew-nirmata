class Nctl < Formula
  desc ""
  homepage "https://github.com/nirmata/go-nctl"
  version "0.0.0"
  depends_on :macos

  # Define the custom download strategy within the Nctl class
  class NctlDownloadStrategy < CurlDownloadStrategy
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

  on_macos do
    url "https://nirmata-downloads.s3.us-east-2.amazonaws.com/nctl/nctl_3.4.0-rc2/nctl_3.4.0-rc2_macos_64-bit.zip", :using => NctlDownloadStrategy
    sha256 "c044e82369c11428e893728e2f411ce34b0d4a9be19a95a8d95e4c6535ea4695"

    def install
      bin.install "nctl"
    end
  end
end

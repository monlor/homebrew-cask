cask "media-center" do
  version "31.00.69"
  sha256 "6e2e9b1ab1de2e581bad75048bb61146a4947d06381401cea4bc497644527efa"

  url "https://files.jriver-cdn.com/mediacenter/channels/v#{version.major}/stable/MediaCenter#{version.no_dots}-Universal.dmg",
      verified: "files.jriver-cdn.com/mediacenter/"
  name "JRiver Media Center"
  desc "Media manager and player"
  homepage "https://www.jriver.com/index.html"

  livecheck do
    url "https://www.jriver.com/download.html"
    regex(/MediaCenter(\d\d)(\d\d)(\d\d+)-Universal\.dmg/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]}.#{match[1]}.#{match[2]}" }
    end
  end

  auto_updates true

  app "Media Center #{version.major}.app"

  zap trash: [
    "~/Documents/JRiver/",
    "~/Library/Application Support/J River/",
    "~/Library/Caches/com.jriver.MediaCenter#{version.major}",
    "~/Library/Cookies/com.jriver.MediaCenter#{version.major}*",
    "~/Library/Preferences/com.jriver.MediaCenter#{version.major}.plist",
    "~/Library/Saved Application State/com.jriver.MediaCenter#{version.major}.savedState",
  ]
end

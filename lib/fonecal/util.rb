module Fonecal
  class Util
    def self.getRootUrl(site)
      return site.match('.+\.com').to_s
    end
  end
end

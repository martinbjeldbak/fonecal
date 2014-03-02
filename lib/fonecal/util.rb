require 'timezone'
require 'active_support/all'

module Fonecal
  class Util
    def self.getRootUrl(site)
      site.match('.+\.com').to_s
    end

    def self.dtToUTC(dt)
      #dt.with_offset(0).strftime("%Y%m%dT%H%M%S")
      dt.utc.strftime("%Y%m%dT%H%M%S")
    end
  end

end

class String
  def cap
    self.gsub(/\w+/).map(&:capitalize).join(' ')
  end
end

Timezone::Configure.begin do |c|
    c.username = 'fonecal'
end

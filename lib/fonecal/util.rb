require 'timezone'

module Fonecal
  class Util
    def self.getRootUrl(site)
      return site.match('.+\.com').to_s
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

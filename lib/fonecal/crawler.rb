require 'open-uri'
require 'nokogiri'

module Fonecal
  class Crawler
    attr_accessor :site, :root

    def initialize(site)
      self.site = Nokogiri::HTML(open(site), nil, 'utf-8')
      self.root = Util.getRootUrl(site)
    end
  end
end

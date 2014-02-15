require 'open-uri'
require 'nokogiri'

module Fonecal
  class Crawler
    attr_reader :site

    def initialize(site)
      @site = Nokogiri::HTML(open(site))
      @root = Util.getRootUrl(site)
    end
  end
end

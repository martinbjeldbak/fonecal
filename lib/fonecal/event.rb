module Fonecal
  class Event
    attr_accessor :start, :location, :crawler

    def initialize(eventWebsite)
      self.crawler = EventCrawler.new(eventWebsite)
    end

    def raceTitle 
      @crawler.gp.gsub(/\w+/).map(&:capitalize).join(' ')
    end

    def grandPrix
    end

    def to_ical
    end
  end
end

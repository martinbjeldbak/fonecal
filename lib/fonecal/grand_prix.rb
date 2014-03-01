require 'geocoder'
require 'timezone'

module Fonecal
  class GrandPrix
    attr_accessor :events, :circuitInfo

    def initialize(eventWebsite)
      @crawler = EventCrawler.new(eventWebsite)
      self.circuitInfo = CircuitInfo.new(@crawler.circuitInfo)
      self.events = []

      createEvents
    end

    def location
      Geocoder.search("#{@circuitInfo.city}").first
    end

    def country
      location.country
    end

    def timezone
      Timezone::Zone.new :latlon => location.geometry["location"].values
    end

    def raceTitle 
      @crawler.gp.gsub(/\w+/).map(&:capitalize).join(' ')
    end

    def grandPrix
      # Belgian Grand Prix
    end

    def to_ical
    end

    private

    def createEvents
      @crawler.timeTables.each do |day|
        day[:sessions].each do |event|
          type = event[:type]
          event[:date] = day[:date]

          if(type.include? "Practice")
            @events << Practice.new(event, timezone)
          elsif(type.include? "Qualifying")
            @events << Qualifying.new(event, timezone)
          elsif(type.include? "Race")
            @events << Race.new(event, timezone)
          end
        end
      end
    end
  end
end

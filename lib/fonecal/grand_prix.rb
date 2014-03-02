require 'geocoder'
require 'timezone'

module Fonecal
  class GrandPrix
    attr_accessor :events, :circuit

    def initialize(eventWebsite)
      @crawler = EventCrawler.new(eventWebsite)
      self.circuit= CircuitInfo.new(@crawler.circuitInfo)
      self.events = []

      createEvents
    end

    def location
      if @res ||= Geocoder.search("#{@circuit.name}, #{@circuit.city}").first
        @res
      elsif @res ||= Geocoder.search("#{@circuit.city}").first
        @res
      elsif res ||= Geocoder.search("#{@circuit.name}").first
        @res
      else
        @res
      end

      #@location ||= Geocoder.search("#{@circuit.name}, #{@circuit.city}").first
    end

    def city
      @circuit.city
    end

    def country
      location.country
    end

    def timezone
      @timezone ||= Timezone::Zone.new :latlon => location.geometry["location"].values
    end

    def raceTitle 
      @crawler.gp.gsub(/\w+/).map(&:capitalize).join(' ')
    end

    def grandPrix
      "#{country} GP"
      # Belgian Grand Prix
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

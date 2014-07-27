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
      title = @crawler.gp.split(/(\W)/).map(&:capitalize).join

      # Dirty decapitalization hack
      title = title.gsub(/Í/, 'í')
      title = title.gsub(/J/, 'j')
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

          if ['practice 1', 'practice 2', 'practice 3'].include?(type.downcase)
            @events << Practice.new(event, timezone)
          elsif type == "Qualifying"
            @events << Qualifying.new(event, timezone)
          elsif type == "Race"
            @events << Race.new(event, timezone)
          end
        end
      end
    end
  end
end

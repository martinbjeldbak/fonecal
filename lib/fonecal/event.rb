require 'active_support/all'

module Fonecal
  class Event
    attr_accessor :name, :start, :end 

    def initialize(event, timezone)
      # UTC offset in hours, explicitely add +
      if (timezone.utc_offset / 60 / 60) > 0
        offset = "+#{timezone.utc_offset / 60 / 60}"
      else
        offset = offset.to_s
      end
      
      self.name = event[:type]
      self.start = DateTime.parse("#{event[:date]}T#{event[:start]} #{offset}")

      if event[:end]
        self.end = DateTime.parse("#{event[:date]}T#{event[:end]} #{offset}") 
      else
        self.end = self.start + 4.hours
      end
    end
  end
end

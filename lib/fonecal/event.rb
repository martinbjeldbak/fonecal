require 'active_support/time'

module Fonecal
  class Event
    attr_accessor :name, :start, :end 

    def initialize(event, timezone)
      self.name = event[:type]

      # Extract info from date string
      date,month,year = event[:date].split(' ')[1..-1]

      # Convert month from string to integer
      month = Date::MONTHNAMES.index(month)

      # Parse and set starting time
      start_hr, start_m = event[:start].split(':')

      # Set timezone to what was given
      Time.zone = timezone.zone

      # Look up timezone in day, taking dst into account
      @start = Time.zone.local(year, month, date, start_hr, start_m, 0)

      # Parse and set ending time
      if event[:end] # a practice sessions
        end_hr, end_m = event[:end].split(':')
        @end = Time.zone.local(year, month, date, end_hr, end_m, 0)
      elsif self.class == Qualifying
        @end = @start + (1.hour + 30.minutes)
      else # race
        @end = @start + 4.hours
      end
    end
  end
end

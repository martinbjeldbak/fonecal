require 'active_support/all'

module Fonecal
  class Event
    attr_accessor :name, :start, :end 

    def initialize(event, timezone)
      self.name = event[:type]

      # UTC offset in hours, explicitely add +
      offset_in_hrs = timezone.utc_offset / 60 / 60

      if offset_in_hrs > 0 && offset_in_hrs < 10
        offset = "+0#{offset_in_hrs}"
      elsif offset_in_hrs > 0
        offset = "+#{offset_in_hrs}"
      elsif offset_in_hrs < 0 && offset_in_hrs > -10
        offset = "-0#{-offset_in_hrs}"
      else # offset is lower than -10
        offset = offset_in_hrs.to_s
      end

      # Extract info from date string
      date,month,year = event[:date].split(' ')[1..-1]

      # Convert month from string to integer
      month = Date::MONTHNAMES.index(month)

      # Parse and set starting time
      start_hr, start_m = event[:start].split(':')
      self.start = Time.new(year, month, date, start_hr, start_m, 0, "#{offset}:00")

      # Parse and set ending time
      if event[:end] # a practice sessions
        end_hr, end_m = event[:end].split(':')
        self.end = Time.new(year, month, date, end_hr, end_m, 0, "#{offset}:00")
      elsif self.class == Qualifying
        self.end = self.start + (1.hour + 30.minutes)
      else # race
        self.end = self.start + 4.hours
      end
    end
  end
end

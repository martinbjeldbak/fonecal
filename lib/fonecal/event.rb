module Fonecal
  class Event
    attr_accessor :name, :start, :session

    def initialize(event, timezone)
      # UTC offset in hours, explicitely add +
      if (timezone.utc_offset / 60 / 60) > 0
        offset = "+#{timezone.utc_offset / 60 / 60}"
      else
        offset = offset.to_s
      end

      self.name = event[:type]
      self.start = DateTime.parse("#{event[:date]}T#{event[:start]} #{offset}")
    end
  end
end

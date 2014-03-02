module Fonecal
  class Calendar
    attr_accessor :calendar

    def initialize(gps)
      self.calendar = File.new('f1cal.ical', 'w')

      @calendar.puts "BEGIN: VCALENDAR"
      @calendar.puts "VERSION: 2.0"
      @calendar.puts "PRODID: -//fonecal//NONSGML v1.0//EN"

      gps.each do |gp|
        gp.events.each do |event|
          addEvent(gp, event)
        end
      end

      @calendar.puts "END: VCALENDAR"
      finish
    end

    private

    def finish
      @calendar.close
    end

    def addEvent(gp, event)
      @calendar.puts "BEGIN: VEVENT"

      @calendar.puts "SUMMARY: #{event.name}"
      @calendar.puts "DESCRIPTION: #{gp.grandPrix}: #{event.name}"
      @calendar.puts "DTSTAMP: #{Util.dtToUTC(DateTime.now)}"
      @calendar.puts "LOCATION: #{gp.city}, #{gp.country}"
      @calendar.puts "DTSTART: #{Util.dtToUTC(event.start)}Z"
      @calendar.puts "DTEND: #{Util.dtToUTC(event.end)}Z"

      @calendar.puts "END: VEVENT"
    end
  end
end

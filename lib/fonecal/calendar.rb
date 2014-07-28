module Fonecal
  class Calendar
    attr_accessor :calendar

    def initialize(gps)
      @calendar = File.new('fonecal.ics', 'w')

      @calendar.puts "BEGIN:VCALENDAR"
      @calendar.puts "VERSION:2.0"
      @calendar.puts "PRODID:-//fonecal//NONSGML v1.0//EN"
      @calendar.puts ""

      gps.each do |gp|
        gp.events.each do |event|
          addEvent(gp, event)
        end
      end

      @calendar.puts "END:VCALENDAR"
      @calendar.close
    end

    private

    def addEvent(gp, event)
      @calendar.puts "BEGIN:VEVENT"

      @calendar.puts "SUMMARY:#{gp.grandPrix}: #{event.name}"
      @calendar.puts "DESCRIPTION:#{gp.raceTitle}: #{event.name}"
      @calendar.puts "DTSTAMP:#{Util.dtToUTC(Time.now)}Z"
      @calendar.puts "LOCATION:#{gp.city}, #{gp.country}"
      @calendar.puts "DTSTART:#{Util.dtToUTC(event.start)}Z"
      puts "#{gp.grandPrix}: #{event.name} starts #{event.start} UTC: #{event.start.utc}"
      @calendar.puts "DTEND:#{Util.dtToUTC(event.end)}Z"

      @calendar.puts "END:VEVENT"
      @calendar.puts ""
    end
  end
end

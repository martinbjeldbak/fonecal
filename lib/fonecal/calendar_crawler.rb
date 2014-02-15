module Fonecal
  class CalendarCrawler < Crawler

    def eventLinks
      eventLinks = []

      @site.css('table.raceCalender tr.row').each do |event|
        eventLinks << @root + event.css('td.raceLocation a').attr('href')
      end
      eventLinks
    end
  end
end

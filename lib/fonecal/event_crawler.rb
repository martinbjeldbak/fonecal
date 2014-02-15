require 'open-uri'
require 'nokogiri'

module Fonecal
  class EventCrawler < Crawler
    def gp
      @site.css('div.raceResultsHeading').text.strip
    end

    def circuitInfo
      ci = {}

      @site.css('div.circuitInfoBox table tr').each do |row|
        ci[row.css('td')[0].content.strip] = row.css('td')[1].content.strip
      end

      return ci
    end

    def timeTables
      tables = []
      @site.css('div#ctl00_ContentSub_Timetable1_subModuleContentDiv table').each do |tt|
        tables << parseTimeTable(tt)
      end
      tables
    end

    private

    def sessionData(row)
      inf ||= {}

      sessData = row.css('td')
      inf[:type] = sessData[0].text.strip
      inf[:start] = sessData[1].css('span')[0].text.strip
      inf
    end

    def parseTimeTable(table)
      info ||= {}

      rows = table.css 'tr'

      # The date is the first row in teh table
      info[:date] = rows[0].text.strip

      # Now extract info from each of the remaining rows
      # Example: Practice 1 12:30 - 14:00 is stored in a row
      info[:sessions] ||= []
      rows[1..-1].each do |row|
        info[:sessions] << sessionData(row)
      end

      info
    end
  end
end

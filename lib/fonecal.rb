require 'fonecal/version'
require 'fonecal/util'
require 'fonecal/crawler'
require 'fonecal/event_crawler'
require 'fonecal/calendar_crawler'
require 'fonecal/calendar'
require 'fonecal/grand_prix'
require 'fonecal/event'
require 'fonecal/session'
require 'fonecal/practice'
require 'fonecal/qualifying'
require 'fonecal/race'
require 'fonecal/circuit_info'

module Fonecal
  def self.create_ical
    gps = []

    Fonecal::CalendarCrawler.new("http://www.formula1.com/races/calendar.html").eventLinks.each do |l|
      gps << Fonecal::GrandPrix.new(l)
    end

    Fonecal::Calendar.new(gps)
  end
end

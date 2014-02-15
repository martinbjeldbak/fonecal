require 'fonecal'

describe Fonecal::CalendarCrawler do
  let(:crawler) { Fonecal::CalendarCrawler.new("http://www.formula1.com/races/calendar.html") }

  it "successfully connects to the website" do
    crawler.site.should_not be_nil
  end

  describe "#eventLinks" do
    it "returns 19 grand prix links" do
      crawler.eventLinks.count.should eql(19)
    end

    it "has the full url" do
      crawler.eventLinks.first.should eql('http://www.formula1.com/races/in_detail/australia_914/circuit_diagram.html')
    end
  end
end

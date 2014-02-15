require 'fonecal'

describe Fonecal::Util do
  describe "#getRootURL" do
    it "extracts formula1.com from any url" do
      calSite = "http://www.formula1.com/races/calendar.html"
      Fonecal::Util.getRootUrl(calSite).should eql('http://www.formula1.com')
    end
  end
end

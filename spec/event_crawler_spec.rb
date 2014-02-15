require 'fonecal'

describe Fonecal::EventCrawler do
  let(:crawler) { Fonecal::EventCrawler.new("http://www.formula1.com/races/in_detail/australia_914/circuit_diagram.html") }

  it "successfully connects to the website" do
    crawler.site.should_not be_nil
  end

  describe "#circuitInfo" do
    it "fetches a circuit name" do
      crawler.circuitInfo['Circuit Name:'].should eq 'Albert Park'
    end

    it "fetches a date" do
      crawler.circuitInfo['Race Date:'].should_not be_nil
    end
  end

  describe "#gp" do
    it "should fetch the GP name" do
      crawler.gp.should eq '2014 FORMULA 1 ROLEX AUSTRALIAN GRAND PRIX'
    end
  end

  describe "#timeTables" do
    it "should get three timetables" do
      crawler.timeTables.count.should eq 3
    end

    it "should have data for the race" do
      crawler.timeTables.last[:sessions].first[:type].should eq 'Race'
      crawler.timeTables.last[:sessions].first[:start].should eq '17:00'
      crawler.timeTables.last[:date].should eq 'Sun 16 March 2014'
    end
  end
end

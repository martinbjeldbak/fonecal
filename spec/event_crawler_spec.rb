require 'fonecal'

describe Fonecal::EventCrawler do
  let(:crawler) { Fonecal::EventCrawler.new("http://www.formula1.com/races/in_detail/australia_914/circuit_diagram.html") }

  it "successfully connects to the website" do
    crawler.site.should_not be_nil
  end

  describe "2014 Australian GP" do
    describe "#circuitInfo" do
      it "fetches a circuit name" do
        crawler.circuitInfo['Circuit Name:'].should eq 'Albert Park'
      end

      it "fetches a date" do
        crawler.circuitInfo['Race Date:'].should_not be_nil
      end

      it "fetches a city" do
        crawler.circuitInfo['City:'].should eq 'Melbourne'
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

      it "should have data about practice 1" do
        crawler.timeTables.first[:date].should eq 'Fri 14 March 2014'
        crawler.timeTables.first[:sessions].first[:type].should eq 'Practice 1'
        crawler.timeTables.first[:sessions].first[:start].should eq '12:30'
      end

      it "should have data about practice 2" do
        crawler.timeTables.first[:date].should eq 'Fri 14 March 2014'
        crawler.timeTables.first[:sessions].last[:type].should eq 'Practice 2'
        crawler.timeTables.first[:sessions].last[:start].should eq '16:30'
      end

      it "should have data about practice 3" do
        crawler.timeTables[1][:date].should eq 'Sat 15 March 2014'
        crawler.timeTables[1][:sessions].first[:type].should eq 'Practice 3'
        crawler.timeTables[1][:sessions].first[:start].should eq '14:00'
      end

      it "should have data about qualifying" do
        crawler.timeTables[1][:date].should eq 'Sat 15 March 2014'
        crawler.timeTables[1][:sessions].last[:type].should eq 'Qualifying'
        crawler.timeTables[1][:sessions].last[:start].should eq '17:00'
      end

      it "should have data about the race" do
        crawler.timeTables.last[:date].should eq 'Sun 16 March 2014'
        crawler.timeTables.last[:sessions].first[:type].should eq 'Race'
        crawler.timeTables.last[:sessions].first[:start].should eq '17:00'
      end
    end
  end
end


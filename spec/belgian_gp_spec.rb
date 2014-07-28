require 'fonecal'

describe Fonecal::GrandPrix do
  describe "Getting Belgian GP info" do
    let(:belgianGP) { Fonecal::GrandPrix.new("http://www.formula1.com/races/in_detail/belgium_927/circuit_diagram.html") }

    it "should have the correct race title" do
      belgianGP.raceTitle.should eql "2014 Formula 1 Shell Belgian Grand Prix"
    end

    it "should get a country" do
      belgianGP.country.should eql "Belgium"
    end

    it "has location object" do
      belgianGP.location.should_not be_nil
    end

    describe "its events" do
      describe "Practice 1" do
        it "should have the right name" do
          belgianGP.events.first.name.should eql "Practice 1"
        end

        it "should have the correct start time" do
          belgianGP.events.first.start.should eql Time.new(2014, 8, 22, 10, 0, 0, '+02:00')
        end
      end
    end
  end
end

require 'fonecal'

describe Fonecal::Event do
  describe "Getting GP info" do
    let(:belgianGP) { Fonecal::Event.new("http://www.formula1.com/races/in_detail/belgium_927/circuit_diagram.html") }

    it "should have the correct race title" do
      belgianGP.raceTitle.should eql "2014 Formula 1 Shell Belgian Grand Prix"
    end
  end
end

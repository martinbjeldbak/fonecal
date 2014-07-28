require 'fonecal'

describe Fonecal::GrandPrix do

  describe "Abu Dhabi GP" do
    subject(:abudabiGP) { Fonecal::GrandPrix.new('http://www.formula1.com/races/in_detail/abu_dhabi_932/circuit_diagram.html') }

    it "should have the correct race title" do
      expect(abudabiGP.raceTitle).to eql "2014 Formula 1 Etihad Airways Abu Dhabi Grand Prix"
    end 

    it "should be in Canada" do
      expect(abudabiGP.country).to eql "United Arab Emirates"
    end

    it "should be in Montreal" do
      expect(abudabiGP.city).to eql "Yas Marina"
    end

    it "should be in the EST timezone" do
      gts = Timezone::Zone.new(zone: "Etc/GMT+4")
      abuTS = Timezone::Zone.new(zone: "Asia/Dubai")
      now = Time.now

      expect(abudabiGP.timezone.time(now).to_i).to eq gts.time(now).to_i
      expect(abudabiGP.timezone.time(now).to_i).to eq abuTS.time(now).to_i
    end

    it "should have 5 events" do
      expect(abudabiGP.events.count).to eql 5
    end

    context "practice 1" do
      subject(:p1) { abudabiGP.events.first }

      it "should be of type Practice" do
        expect(p1.class).to eql Fonecal::Practice
      end

      it "should start at 13:00 CET on friday" do
        expect(p1.start).to eql Time.new(2014, 11, 21, 13, 0, 0, '+04:00')
        puts p1.start.utc
        expect(p1.start).to eql Time.new(2014, 11, 21, 10, 0, 0, '+01:00')
      end

      it "should end at 11:30 CET on friday" do
        expect(p1.end).to eql Time.new(2014, 11, 21, 14, 30, 0, '+04:00')
        expect(p1.end).to eql Time.new(2014, 11, 21, 11, 30, 0, '+01:00')
      end
    end

    #context "practice 2" do
    #  subject(:p2) { abudabiGP.events[1] }

    #  it "should be of type Practice" do
    #    expect(p2.class).to eql Fonecal::Practice
    #  end

    #  it "should start at 20:00 on friday" do
    #    expect(p2.start).to eql Time.new(2014, 6, 6, 20, 0, 0, '+02:00')
    #    expect(p2.start).to eql Time.new(2014, 6, 6, 14, 0, 0, '+10:00')
    #  end

    #  it "should end at 21:30 on friday" do
    #    expect(p2.end).to eql Time.new(2014, 6, 6, 21, 30, 0, '+02:00')
    #    expect(p2.end).to eql Time.new(2014, 6, 6, 15, 30, 0, '+10:00')
    #  end
    #end

    #context "practice 3" do
    #  subject(:p3) { abudabiGP.events[2] }

    #  it "should be of type Practice" do
    #    expect(p3.class).to eql Fonecal::Practice
    #  end

    #  it "should start at 16:00 on saturday" do
    #    expect(p3.start).to eql Time.new(2014, 6, 7, 16, 0, 0, '+02:00')
    #    expect(p3.start).to eql Time.new(2014, 6, 7, 10, 0, 0, '+10:00')
    #  end

    #  it "should end at 17:00 on saturday" do
    #    expect(p3.end).to eql Time.new(2014, 6, 7, 17, 0, 0, '+02:00')
    #    expect(p3.end).to eql Time.new(2014, 6, 7, 11, 0, 0, '+10:00')
    #  end
    #end

    #context "qualifying" do
    #  subject(:q) { abudabiGP.events[3] }

    #  it "should be of type Practice" do
    #    expect(q.class).to eql Fonecal::Qualifying
    #  end

    #  it "should start at 19:00 on saturday" do
    #    expect(q.start).to eql Time.new(2014, 6, 7, 19, 0, 0, '+02:00')
    #    expect(q.start).to eql Time.new(2014, 6, 7, 13, 0, 0, '+10:00')
    #  end

    #  it "should end at 20:30 on saturday" do
    #    expect(q.end).to eql Time.new(2014, 6, 7, 20, 30, 0, '+02:00')
    #    expect(q.end).to eql Time.new(2014, 6, 7, 14, 30, 0, '+10:00')
    #  end
    #end

    #context "race" do
    #  subject(:race) { abudabiGP.events[4] }

    #  it "should be of type Practice" do
    #    expect(race.class).to eql Fonecal::Race
    #  end

    #  it "should start at 20:00 on sunday" do
    #    expect(race.start).to eql Time.new(2014, 6, 8, 20, 0, 0, '+02:00')
    #    expect(race.start).to eql Time.new(2014, 6, 8, 14, 0, 0, '+10:00')
    #  end

    #  it "should end at 24:00 on sunday" do
    #    expect(race.end).to eql Time.new(2014, 6, 8, 24, 0, 0, '+02:00')
    #    expect(race.end).to eql Time.new(2014, 6, 8, 18, 0, 0, '+10:00')
    #  end
    #end
  end
end

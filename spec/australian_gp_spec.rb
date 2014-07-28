require 'fonecal'

describe Fonecal::GrandPrix do

  describe "Australian GP" do
    subject(:australianGP) { Fonecal::GrandPrix.new('http://www.formula1.com/races/in_detail/australia_914/circuit_diagram.html') }

    it "should have the correct race title" do
      expect(australianGP.raceTitle).to eql "2014 Formula 1 Rolex Australian Grand Prix"
    end 

    it "should be in Canada" do
      expect(australianGP.country).to eql "Australia"
    end

    it "should be in Montreal" do
      expect(australianGP.city).to eql "Melbourne"
    end

    it "should be in the EST timezone" do
      aestTS = Timezone::Zone.new(zone: "Etc/GMT+10")
      melbourneTS = Timezone::Zone.new(zone: "Australia/Melbourne")
      now = Time.now

      #expect(australianGP.timezone.time(now).to_i).to eq estTS.time(now).to_i
      expect(australianGP.timezone.time(now).to_i).to eq melbourneTS.time(now).to_i
    end

    it "should have 5 events" do
      expect(australianGP.events.count).to eql 5
    end

    context "practice 1" do
      subject(:p1) { australianGP.events.first }

      it "should be of type Practice" do
        expect(p1.class).to eql Fonecal::Practice
      end

      it "should start at 2:30 CET on friday" do
        expect(p1.start).to eql Time.new(2014, 3, 14, 12, 30, 0, '+10:00')
        expect(p1.start).to eql Time.new(2014, 3, 14, 2, 30, 0, '+01:00')
      end

      it "should end at 4:30 CET on friday" do
        expect(p1.end).to eql Time.new(2014, 3, 14, 14, 0, 0, '+10:00')
        expect(p1.end).to eql Time.new(2014, 3, 14, 4, 0, 0, '+01:00')
      end
    end

    #context "practice 2" do
    #  subject(:p2) { australianGP.events[1] }

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
    #  subject(:p3) { australianGP.events[2] }

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
    #  subject(:q) { australianGP.events[3] }

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
    #  subject(:race) { australianGP.events[4] }

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

require 'fonecal'

describe Fonecal::GrandPrix do
  describe "Canadian GP" do
    subject(:canadianGP) { Fonecal::GrandPrix.new('http://www.formula1.com/races/in_detail/canada_922/circuit_diagram.html') }

    it "should have the correct race title" do
      expect(canadianGP.raceTitle).to eql "Formula 1 Grand Prix Du Canada 2014"
    end 

    it "should be in Canada" do
      expect(canadianGP.country).to eql "Canada"
    end

    it "should be in Montreal" do
      #expect(canadianGP.city).to eql "Montreal"
    end

    it "should be in the EST timezone" do
      estTS = Timezone::Zone.new(zone: "EST")
      montrealTS = Timezone::Zone.new(zone: "America/Montreal")
      now = Time.now

      #expect(canadianGP.timezone.time(now).to_i).to eq estTS.time(now).to_i
      expect(canadianGP.timezone.time(now).to_i).to eq montrealTS.time(now).to_i
    end

    it "should have 5 events" do
      expect(canadianGP.events.count).to eql 5
    end

    context "practice 1" do
      subject(:p1) { canadianGP.events.first }

      it "should be of type Practice" do
        expect(p1.class).to eql Fonecal::Practice
      end

      it "should start at 16:00 CET on friday" do
        expect(p1.start).to eql Time.new(2014, 6, 6, 16, 0, 0, '+02:00')
        expect(p1.start).to eql Time.new(2014, 6, 6, 10, 0, 0, '-04:00')
      end

      it "should end at 17:30 CET on friday" do
        expect(p1.end).to eql Time.new(2014, 6, 6, 17, 30, 0, '+02:00')
        expect(p1.end).to eql Time.new(2014, 6, 6, 11, 30, 0, '-04:00')
      end
    end

    context "practice 2" do
      subject(:p2) { canadianGP.events[1] }

      it "should be of type Practice" do
        expect(p2.class).to eql Fonecal::Practice
      end

      it "should start at 20:00 on friday" do
        expect(p2.start).to eql Time.new(2014, 6, 6, 20, 0, 0, '+02:00')
        expect(p2.start).to eql Time.new(2014, 6, 6, 14, 0, 0, '-04:00')
      end

      it "should end at 21:30 on friday" do
        expect(p2.end).to eql Time.new(2014, 6, 6, 21, 30, 0, '+02:00')
        expect(p2.end).to eql Time.new(2014, 6, 6, 15, 30, 0, '-04:00')
      end
    end

    context "practice 3" do
      subject(:p3) { canadianGP.events[2] }

      it "should be of type Practice" do
        expect(p3.class).to eql Fonecal::Practice
      end

      it "should start at 16:00 on saturday" do
        expect(p3.start).to eql Time.new(2014, 6, 7, 16, 0, 0, '+02:00')
        expect(p3.start).to eql Time.new(2014, 6, 7, 10, 0, 0, '-04:00')
      end

      it "should end at 17:00 on saturday" do
        expect(p3.end).to eql Time.new(2014, 6, 7, 17, 0, 0, '+02:00')
        expect(p3.end).to eql Time.new(2014, 6, 7, 11, 0, 0, '-04:00')
      end
    end

    context "qualifying" do
      subject(:q) { canadianGP.events[3] }

      it "should be of type Practice" do
        expect(q.class).to eql Fonecal::Qualifying
      end

      it "should start at 19:00 on saturday" do
        expect(q.start).to eql Time.new(2014, 6, 7, 19, 0, 0, '+02:00')
        expect(q.start).to eql Time.new(2014, 6, 7, 13, 0, 0, '-04:00')
      end

      it "should end at 20:30 on saturday" do
        expect(q.end).to eql Time.new(2014, 6, 7, 20, 30, 0, '+02:00')
        expect(q.end).to eql Time.new(2014, 6, 7, 14, 30, 0, '-04:00')
      end
    end

    context "race" do
      subject(:race) { canadianGP.events[4] }

      it "should be of type Practice" do
        expect(race.class).to eql Fonecal::Race
      end

      it "should start at 20:00 on sunday" do
        expect(race.start).to eql Time.new(2014, 6, 8, 20, 0, 0, '+02:00')
        expect(race.start).to eql Time.new(2014, 6, 8, 14, 0, 0, '-04:00')
      end

      it "should end at 24:00 on sunday" do
        expect(race.end).to eql Time.new(2014, 6, 8, 24, 0, 0, '+02:00')
        expect(race.end).to eql Time.new(2014, 6, 8, 18, 0, 0, '-04:00')
      end
    end
  end
end

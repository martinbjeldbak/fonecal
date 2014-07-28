require 'fonecal'

describe Fonecal::GrandPrix do
  describe "Hungarian GP" do
    subject(:hungarianGP) { Fonecal::GrandPrix.new('http://www.formula1.com/races/in_detail/hungary_926/circuit_diagram.html') }

    it "should have the correct race title" do
      expect(hungarianGP.raceTitle).to eql "Formula 1 Pirelli Magyar Nagydíj 2014"
    end 

    it "should be in Hungary" do
      expect(hungarianGP.country).to eql "Hungary"
    end

    it "should be in Budapest" do
      expect(hungarianGP.city).to eql "Budapest"
    end

    it "should be in the CET timezone" do
      cetTS = Timezone::Zone.new(zone: "CET")
      budapestTS = Timezone::Zone.new(zone: "Europe/Budapest")

      expect(hungarianGP.timezone.time(Time.now).to_i).to eq cetTS.time(Time.now).to_i
      expect(hungarianGP.timezone.time(Time.now).to_i).to eq budapestTS.time(Time.now).to_i
    end

    it "should have 5 events" do
      expect(hungarianGP.events.count).to eql 5
    end

    context "practice 1" do
      subject(:p1) { hungarianGP.events.first }

      it "should be of type Practice" do
        expect(p1.class).to eql Fonecal::Practice
      end

      it "should start at 10:00 on friday" do
        expect(p1.start).to eql Time.new(2014, 7, 25, 10, 0, 0, '+02:00')
      end

      it "should end at 11:30 on friday" do
        expect(p1.end).to eql Time.new(2014, 7, 25, 11, 30, 0, '+02:00')
      end
    end

    context "practice 2" do
      subject(:p2) { hungarianGP.events[1] }

      it "should be of type Practice" do
        expect(p2.class).to eql Fonecal::Practice
      end

      it "should start at 14:00 on friday" do
        expect(p2.start).to eql Time.new(2014, 7, 25, 14, 0, 0, '+02:00')
      end

      it "should end at 15:30 on friday" do
        expect(p2.end).to eql Time.new(2014, 7, 25, 15, 30, 0, '+02:00')
      end
    end

    context "practice 3" do
      subject(:p3) { hungarianGP.events[2] }

      it "should be of type Practice" do
        expect(p3.class).to eql Fonecal::Practice
      end

      it "should start at 10:00 on saturday" do
        expect(p3.start).to eql Time.new(2014, 7, 26, 11, 0, 0, '+02:00')
      end

      it "should end at 11:30 on saturday" do
        expect(p3.end).to eql Time.new(2014, 7, 26, 12, 0, 0, '+02:00')
      end
    end

    context "qualifying" do
      subject(:q) { hungarianGP.events[3] }

      it "should be of type Practice" do
        expect(q.class).to eql Fonecal::Qualifying
      end

      it "should start at 14:00 on saturday" do
        expect(q.start).to eql Time.new(2014, 7, 26, 14, 0, 0, '+02:00')
      end

      it "should end at 15:30 on saturday" do
        expect(q.end).to eql Time.new(2014, 7, 26, 15, 30, 0, '+02:00')
      end
    end

    context "race" do
      subject(:race) { hungarianGP.events[4] }

      it "should be of type Practice" do
        expect(race.class).to eql Fonecal::Race
      end

      it "should start at 14:00 on sunday" do
        expect(race.start).to eql Time.new(2014, 7, 27, 14, 0, 0, '+02:00')
      end

      it "should end at 18:00 on sunday" do
        expect(race.end).to eql Time.new(2014, 7, 27, 18, 0, 0, '+02:00')
      end
    end
  end
end

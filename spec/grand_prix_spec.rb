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

      expect(canadianGP.timezone.time(now).to_i).to eq estTS.time(now).to_i
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
      end

      it "should end at 17:30 CET on friday" do
        expect(p1.end).to eql Time.new(2014, 6, 6, 17, 30, 0, '+02:00')
      end
    end

   # context "practice 2" do
   #   subject(:p2) { canadianGP.events[1] }

   #   it "should be of type Practice" do
   #     expect(p2.class).to eql Fonecal::Practice
   #   end

   #   it "should start at 14:00 on friday" do
   #     expect(p2.start).to eql Time.new(2014, 7, 25, 14, 0, 0, '+02:00')
   #   end

   #   it "should end at 15:30 on friday" do
   #     expect(p2.end).to eql Time.new(2014, 7, 25, 15, 30, 0, '+02:00')
   #   end
   # end

   # context "practice 3" do
   #   subject(:p3) { canadianGP.events[2] }

   #   it "should be of type Practice" do
   #     expect(p3.class).to eql Fonecal::Practice
   #   end

   #   it "should start at 10:00 on saturday" do
   #     expect(p3.start).to eql Time.new(2014, 7, 26, 11, 0, 0, '+02:00')
   #   end

   #   it "should end at 11:30 on saturday" do
   #     expect(p3.end).to eql Time.new(2014, 7, 26, 12, 0, 0, '+02:00')
   #   end
   # end

   # context "qualifying" do
   #   subject(:q) { hungarianGP.events[3] }

   #   it "should be of type Practice" do
   #     expect(q.class).to eql Fonecal::Qualifying
   #   end

   #   it "should start at 14:00 on saturday" do
   #     expect(q.start).to eql Time.new(2014, 7, 26, 14, 0, 0, '+02:00')
   #   end

   #   it "should end at 15:30 on saturday" do
   #     expect(q.end).to eql Time.new(2014, 7, 26, 15, 30, 0, '+02:00')
   #   end
   # end

   # context "race" do
   #   subject(:race) { hungarianGP.events[4] }

   #   it "should be of type Practice" do
   #     expect(race.class).to eql Fonecal::Race
   #   end

   #   it "should start at 14:00 on sunday" do
   #     expect(race.start).to eql Time.new(2014, 7, 27, 14, 0, 0, '+02:00')
   #   end

   #   it "should end at 18:00 on sunday" do
   #     expect(race.end).to eql Time.new(2014, 7, 27, 18, 0, 0, '+02:00')
   #   end
   # end
  end

  #describe "Hungarian GP" do
  #  subject(:hungarianGP) { Fonecal::GrandPrix.new('http://www.formula1.com/races/in_detail/hungary_926/circuit_diagram.html') }

  #  it "should have the correct race title" do
  #    expect(hungarianGP.raceTitle).to eql "Formula 1 Pirelli Magyar Nagydíj 2014"
  #  end 

  #    it "should be in Hungary" do
  #      expect(hungarianGP.country).to eql "Hungary"
  #    end

  #    it "should be in Budapest" do
  #      expect(hungarianGP.city).to eql "Budapest"
  #    end

  #    it "should be in the CET timezone" do
  #      cetTS = Timezone::Zone.new(zone: "CET")
  #      budapestTS = Timezone::Zone.new(zone: "Europe/Budapest")

  #      expect(hungarianGP.timezone.time(Time.now).to_i).to eq cetTS.time(Time.now).to_i
  #      expect(hungarianGP.timezone.time(Time.now).to_i).to eq budapestTS.time(Time.now).to_i
  #    end

  #    it "should have 5 events" do
  #      expect(hungarianGP.events.count).to eql 5
  #    end

  #    context "practice 1" do
  #      subject(:p1) { hungarianGP.events.first }

  #      it "should be of type Practice" do
  #        expect(p1.class).to eql Fonecal::Practice
  #      end

  #      it "should start at 10:00 on friday" do
  #        expect(p1.start).to eql Time.new(2014, 7, 25, 10, 0, 0, '+02:00')
  #      end

  #      it "should end at 11:30 on friday" do
  #        expect(p1.end).to eql Time.new(2014, 7, 25, 11, 30, 0, '+02:00')
  #      end
  #    end

  #    context "practice 2" do
  #      subject(:p2) { hungarianGP.events[1] }

  #      it "should be of type Practice" do
  #        expect(p2.class).to eql Fonecal::Practice
  #      end

  #      it "should start at 14:00 on friday" do
  #        expect(p2.start).to eql Time.new(2014, 7, 25, 14, 0, 0, '+02:00')
  #      end

  #      it "should end at 15:30 on friday" do
  #        expect(p2.end).to eql Time.new(2014, 7, 25, 15, 30, 0, '+02:00')
  #      end
  #    end

  #    context "practice 3" do
  #      subject(:p3) { hungarianGP.events[2] }

  #      it "should be of type Practice" do
  #        expect(p3.class).to eql Fonecal::Practice
  #      end

  #      it "should start at 10:00 on saturday" do
  #        expect(p3.start).to eql Time.new(2014, 7, 26, 11, 0, 0, '+02:00')
  #      end

  #      it "should end at 11:30 on saturday" do
  #        expect(p3.end).to eql Time.new(2014, 7, 26, 12, 0, 0, '+02:00')
  #      end
  #    end
  #  
  #  context "qualifying" do
  #    subject(:q) { hungarianGP.events[3] }

  #    it "should be of type Practice" do
  #      expect(q.class).to eql Fonecal::Qualifying
  #    end

  #    it "should start at 14:00 on saturday" do
  #      expect(q.start).to eql Time.new(2014, 7, 26, 14, 0, 0, '+02:00')
  #    end

  #    it "should end at 15:30 on saturday" do
  #      expect(q.end).to eql Time.new(2014, 7, 26, 15, 30, 0, '+02:00')
  #    end
  #  end

  #  context "race" do
  #    subject(:race) { hungarianGP.events[4] }

  #    it "should be of type Practice" do
  #      expect(race.class).to eql Fonecal::Race
  #    end

  #    it "should start at 14:00 on sunday" do
  #      expect(race.start).to eql Time.new(2014, 7, 27, 14, 0, 0, '+02:00')
  #    end

  #    it "should end at 18:00 on sunday" do
  #      expect(race.end).to eql Time.new(2014, 7, 27, 18, 0, 0, '+02:00')
  #    end
  #  end
  #end


  #describe "Getting Belgian GP info" do
  #  let(:belgianGP) { Fonecal::GrandPrix.new("http://www.formula1.com/races/in_detail/belgium_927/circuit_diagram.html") }

  #  it "should have the correct race title" do
  #    belgianGP.raceTitle.should eql "2014 Formula 1 Shell Belgian Grand Prix"
  #  end

  #  it "should get a country" do
  #    belgianGP.country.should eql "Belgium"
  #  end

  #  it "has location object" do
  #    belgianGP.location.should_not be_nil
  #  end

  #  describe "its events" do
  #    describe "Practice 1" do
  #      it "should have the right name" do
  #        belgianGP.events.first.name.should eql "Practice 1"
  #      end

  #      it "should have the correct start time" do
  #        belgianGP.events.first.start.should eql Time.new(2014, 8, 22, 10, 0, 0, '+02:00')
  #      end
  #    end
  #  end
  #end
end

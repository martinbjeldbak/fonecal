require 'fonecal'
require 'active_support/time'

describe Fonecal::GrandPrix do
  describe "Brazillian GP" do
    subject(:brazilianGP) { Fonecal::GrandPrix.new('http://www.formula1.com/races/in_detail/brazil_935/circuit_diagram.html') }

    it "should have the correct race title" do
      expect(brazilianGP.raceTitle).to eql "Formula 1 Grande Premio Petrobras Do Brasil 2014"
    end 

    it "should be in Brazil" do
      expect(brazilianGP.country).to eql "Brazil"
    end

    it "should be in Montreal" do
      expect(brazilianGP.city).to eql "São Paulo"
    end

    it "should be in the BRT timezone" do
      expect(brazilianGP.timezone.zone).to eql "America/Sao_Paulo"
    end

    it "should have 5 events" do
      expect(brazilianGP.events.count).to eql 5
    end

    context "practice 1" do
      subject(:p1) { brazilianGP.events.first }

      it "should be of type Practice" do
        expect(p1.class).to eql Fonecal::Practice
      end

      it "should start at 10:00 BRT on friday" do
        Time.zone = brazilianGP.timezone.zone
        expect(p1.start).to eql Time.zone.local(2014, 11, 7, 10, 0, 0)
      end

      it "should start at 13:00 CET on friday" do
        Time.zone = 'Europe/Copenhagen'
        expect(p1.start).to eql Time.zone.local(2014, 11, 7, 13, 0, 0)
      end

      #it "should end at 11:30 BRT on friday" do
      #  Time.zone = brazilianGP.timezone.zone
      #  expect(p1.end).to eql Time.zone.local(2014, 11, 7, 11, 30, 0)
      #end

      #it "should end at 14:30 CET on friday" do
      #  Time.zone = 'Europe/Copenhagen'
      #  expect(p1.end).to eql Time.zone.local(2014, 11, 7, 14, 30, 0)
      #end
    end

    #context "practice 2" do
    #  subject(:p2) { brazilianGP.events[1] }

    #  it "should be of type Practice" do
    #    expect(p2.class).to eql Fonecal::Practice
    #  end

    #  it "should start at 14:00 BRT on friday" do
    #    Time.zone = brazilianGP.timezone.zone
    #    expect(p2.start).to eql Time.zone.local(2014, 11, 7, 14, 0, 0)
    #  end

    #  it "should start at 17:00 CET on friday" do
    #    Time.zone = 'Europe/Copenhagen'
    #    expect(p2.start).to eql Time.zone.local(2014, 11, 7, 17, 0, 0)
    #  end

    #  it "should end at 15:30 BRT on friday" do
    #    Time.zone = brazilianGP.timezone.zone
    #    expect(p2.end).to eql Time.zone.local(2014, 11, 7, 15, 30, 0)
    #  end
    #  it "should end at 18:30 CET on friday" do
    #    Time.zone = 'Europe/Copenhagen'
    #    expect(p2.end).to eql Time.zone.local(2014, 11, 7, 18, 30, 0)
    #  end
    #end

    #context "practice 3" do
    #  subject(:p3) { brazilianGP.events[2] }

    #  it "should be of type Practice" do
    #    expect(p3.class).to eql Fonecal::Practice
    #  end

    #  it "should start at 14:00 BRT on saturday" do
    #    Time.zone = brazilianGP.timezone.zone
    #    expect(p3.start).to eql Time.zone.local(2014, 11, 8, 14, 0, 0)
    #  end

    #  it "should start at 16:00 CET on saturday" do
    #    Time.zone = 'Europe/Copenhagen'
    #    expect(p3.start).to eql Time.zone.local(2014, 11, 8, 11, 0, 0)
    #  end

    #  it "should end at 17:00 BRT on saturday" do
    #    Time.zone = brazilianGP.timezone.zone
    #    expect(p3.end).to eql Time.zone.local(2014, 11, 8, 15, 0, 0)
    #  end

    #  it "should end at 17:00 CET on saturday" do
    #    Time.zone = 'Europe/Copenhagen'
    #    expect(p3.end).to eql Time.zone.local(2014, 11, 8, 12, 0, 0)
    #  end
    #end

    #context "qualifying" do
    #  subject(:q) { brazilianGP.events[3] }

    #  it "should be of type Practice" do
    #    expect(q.class).to eql Fonecal::Qualifying
    #  end

    #  it "should start at 14:00 BRT on saturday" do
    #    Time.zone = brazilianGP.timezone.zone
    #    expect(q.start).to eql Time.zone.local(2014, 11, 8, 14, 0, 0)
    #  end

    #  it "should start at 17:00 CET on saturday" do
    #    Time.zone = 'Europe/Copenhagen'
    #    expect(q.start).to eql Time.zone.local(2014, 11, 8, 17, 0, 0)
    #  end

    #  it "should end at 15:30 BRT on saturday" do
    #    Time.zone = brazilianGP.timezone.zone
    #    expect(q.end).to eql Time.zone.local(2014, 11, 8, 15, 30, 0)
    #  end

    #  it "should end at 18:30 CET on saturday" do
    #    Time.zone = 'Europe/Copenhagen'
    #    expect(q.end).to eql Time.zone.local(2014, 11, 8, 18, 30, 0)
    #  end
    #end

    #context "race" do
    #  subject(:race) { brazilianGP.events.last }

    #  it "should be of type Race" do
    #    expect(race.class).to eql Fonecal::Race
    #  end

    #  it "should start at 14:00 BRT on sunday" do
    #    Time.zone = brazilianGP.timezone.zone
    #    expect(race.start).to eql Time.zone.local(2014, 11, 9, 14, 0, 0)
    #  end
    #  it "should start at 17:00 CST on sunday" do
    #    Time.zone = 'Europe/Copenhagen'
    #    expect(race.start).to eql Time.zone.local(2014, 11, 9, 17, 0, 0)
    #  end

    #  it "should end at 18:00 BRT on sunday" do
    #    Time.zone = brazilianGP.timezone.zone
    #    expect(race.end).to eql Time.zone.local(2014, 11, 9, 18, 0, 0)
    #  end

    #  it "should start at 21:00 CET on sunday" do
    #    Time.zone = 'Europe/Copenhagen'
    #    expect(race.end).to eql Time.zone.local(2014, 11, 9, 21, 0, 0)
    #  end
    #end
  end
end

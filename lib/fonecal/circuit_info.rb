module Fonecal
  class CircuitInfo
    def initialize(info)
      @info = info
    end

    def name
      @info['Circuit Name:'].cap
    end

    def city
      @info['City:'].cap
    end

    def laps
      @info['Number of Laps:'].to_i
    end
  end
end

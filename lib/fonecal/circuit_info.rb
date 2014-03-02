module Fonecal
  class CircuitInfo
    def initialize(info)
      @info = info
    end

    def name
      if @info['Circuit Name:']
        @info['Circuit Name:'].cap 
      else
        ""
      end
    end

    def city
      @info['City:'].cap
    end

    def laps
      @info['Number of Laps:'].to_i
    end
  end
end

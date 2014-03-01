module Fonecal
  class Session
    attr_accessor :start, :length

    def initilaize(start, length)
      @start = start
      @length = length
    end
  end
end

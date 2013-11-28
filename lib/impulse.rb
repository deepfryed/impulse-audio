require 'impulse/impulse'

module Impulse
  class Engine
    attr_reader :slots, :max, :samples

    def initialize slots, max
      @slots, @max, @samples = slots, max, Array.new(slots) { 0 }
    end

    def run delay, source = 0
      start
      set_source(source)

      loop do
        update
        yield samples.map(&:to_i) if block_given?
        sleep delay
      end
    end

    def update
      fft  = get_sample
      size = fft.size / 4

      (1..size).step(size / slots).each do |n|
        index     =  ((n - 1).to_f / (size / slots.to_f)).to_i
        amplitude = fft[n] * max

        if amplitude > samples[index]
          samples[index] = amplitude
        else
          samples[index] = [0, samples[index] - (max / 20)].max
        end
      end
    end
  end # Engine
end # Impulse

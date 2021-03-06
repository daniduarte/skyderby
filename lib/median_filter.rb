module MedianFilter
  class MFilter
    def initialize(window_size, keys)
      fail ArgumentError.new('Step must be odd and higher than 2') if window_size_invalid(window_size)
      fail ArgumentError.new('Keys must be array of symbols') if keys_invalid(keys)

      @window_size = window_size
      @keys = keys
    end

    def process(values)
      neighbors = (@window_size / 2).floor
      temp = ([values.first] * neighbors) + values + ([values.last] * neighbors)

      temp.each_cons(@window_size).map do |window|
        @keys.each do |key|
          window[neighbors][key] = window.map { |x| x[key] || 0 }.sort[neighbors]
        end
        window[neighbors]
      end
    end

    private

    def window_size_invalid(window_size)
      window_size < 3 && window_size.even?
    end

    def keys_invalid(keys)
      return true unless keys.is_a?(Array) || !keys.empty? || keys.detect { |x| !x.is_a? Symbol }.nil?
      false
    end
  end

  def self.process(values, window_size, keys)
    median_filter = MFilter.new(window_size, keys)
    median_filter.process values
  end
end

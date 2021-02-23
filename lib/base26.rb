# frozen_string_literal: true

require 'base26/version'

module Base26

  ALPHA = 'abcdefghijklmnopqrstuvwxyz'

  def self.to_int(value)
    chars = value.downcase.split(//).reverse

    chars.each.with_index.inject(0) do |result, (char, index)|
      if (position = ALPHA.index(char)).nil?
        raise ArgumentError, 'Value not a valid Base26 String'
      end

      result + (ALPHA.size**index) * (position + 1)
    end
  end

  def self.to_alpha(value)
    raise ArgumentError, 'Value passed is not an Integer.' unless value.is_a?(Integer)
    return '' if value < 1

    quotient, rest = (value - 1).divmod(ALPHA.size)
    to_alpha(quotient) + ALPHA[rest]
  end

  class << self
    alias decode to_int
    alias encode to_alpha
  end

end

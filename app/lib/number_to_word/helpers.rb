# frozen_string_literal: true
require_relative "./under_hundred.rb"
module NumberToWord
  module Helpers
    include UnderHundred

     DIVISIONS = [
      "",
      "Thousand",
      "Million",
      "Billion",
      "Trillion",
      "Quadrillion",
      "Quintrillion"
    ].freeze



    def result_below_one_thousand(num, counter)
      hundred, remaining = num.divmod(100)

      return higher_than_hundred(hundred, remaining, counter) if hundred != 0

      if counter == 0
        " and " + UNDER_HUNDRED[remaining]
      else
        UNDER_HUNDRED[remaining] if hundred == 0 && remaining != 0
      end
    end

    def higher_than_hundred(hundred, remaining, counter)
      century = UNDER_HUNDRED[hundred]
      if remaining != 0
        return century + " Hundred " + UNDER_HUNDRED[remaining] if counter != 0
        return century + " Hundred and " + UNDER_HUNDRED[remaining]
      end
      return century + " Hundred " if remaining == 0
    end

    def check_sign(num)
      num < 0 ? [num.abs, "negative "] : [num, ""]
    end

    def numerical?(num)
      Integer(num)
    rescue
      raise "A whole number is expected"
    end
  end
end
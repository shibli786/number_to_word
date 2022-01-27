# frozen_string_literal: true
module NumberToWord
  require_relative "./number_to_word/under_hundred.rb"
  require_relative "./number_to_word/helpers.rb"

  include NumberToWord::UnderHundred
  include NumberToWord::Helpers

  def number_to_word(num)
    num = numerical?(num)
    num, sign = check_sign(num)
    return (sign + UNDER_HUNDRED[num]) if num <= 100
    counter = 0
    result = []
    while num != 0

      num, remaining = num.divmod(1000)
      temp_result = result_below_one_thousand(remaining, counter)
      
      result << temp_result + " " + DIVISIONS[counter] + " " if temp_result

      counter += 1
    end
    sign + result.reverse.join(" ").rstrip.downcase.squeeze(' ').strip
  end
end

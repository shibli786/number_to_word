class WelcomeController < ApplicationController
  include NumberToWord
    
  def number_convert
    if request.post?
      number = params[:number].to_i
      @answer = number_to_word(number)
    end
  end

end

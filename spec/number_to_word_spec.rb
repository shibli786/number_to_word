# frozen_string_literal: true
require_relative "spec_helper"
require './app/lib/number_to_word'
RSpec.describe NumberToWord do
  context '#number_to_word' do
    let(:dummy_class) { Class.new { extend NumberToWord } }

    it "converts '1' to `one`" do
      expect(dummy_class.number_to_word(1)).to eq("one")
    end


    it "converts '10' to `one`" do
      expect(dummy_class.number_to_word(10)).to eq("ten")
    end

    it "converts '101' to `one`" do
      expect(dummy_class.number_to_word(101)).to eq("one hundred and one")
    end

     it "converts '1001' to `one`" do
      expect(dummy_class.number_to_word(1001)).to eq("one thousand and one")
    end


    # Test case as for given example

     it "converts '7' to `one`" do
      expect(dummy_class.number_to_word(7)).to eq("seven")
    end

     it "converts '42' to `one`" do
      expect(dummy_class.number_to_word(42)).to eq("forty-two")
    end

     it "converts '1999' to `one`" do
      expect(dummy_class.number_to_word(1999)).to eq("one thousand nine hundred and ninety-nine")
    end

     it "converts '2001' to `one`" do
      expect(dummy_class.number_to_word(2001)).to eq("two thousand and one")
    end

     it "converts '17999' to `one`" do
      expect(dummy_class.number_to_word(17999)).to eq("seventeen thousand nine hundred and ninety-nine")
    end

     it "converts '1300420' to `one`" do
      expect(dummy_class.number_to_word(1300420)).to eq("one million three hundred thousand four hundred and twenty")
    end

  end
end
require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      brownie.add_ingredient(:chocolate)
    end

    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to eq([:chocolate])
    end
  end

  describe "#mix!" do
    ingredients = [:flour, :eggs, :sugar, :sprinkles, :cocoa_powder]

    before(:each) do
      ingredients.each { |ingredient| brownie.add_ingredient(ingredient) }
      brownie.mix!
    end

    it "shuffles the ingredient array" do
      expect(brownie.ingredients).to_not eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    before(:each) do
      brownie.eat(50)
    end

    it "subtracts an amount from the quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(101) }.to raise_error("not enough left!")
    end
  end
end

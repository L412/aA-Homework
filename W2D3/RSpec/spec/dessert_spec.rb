require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cookie) { Dessert.new("cookie", 11, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(11)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("milkshake", "gallon", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("butter")
      expect(cookie.ingredients).to include("butter")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      test_ingredients = %w(flour water sugar chocolate_chips)
      test_ingredients.each {|ingred| cookie.add_ingredient(ingred)}

      expect(cookie.mix!).not_to eq(test_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pre_eat = cookie.quantity
      cookie.eat(1)
      expect(cookie.quantity).to eq(10)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Bartholomew the Great Baker")
      expect(cookie.serve).to eq("Chef Bartholomew the Great Baker has made 11 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end

require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:pie) {Dessert.new("pie", 1 , chef)}
  describe "#initialize" do
      

    it "sets a type" do 
      expect(pie.type).to eq("pie")
    end

    it "sets a quantity" do 
      expect(pie.quantity).to eq(1)
    end

    it "starts ingredients as an empty array" do 
      expect(pie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect{Dessert.new("cake", "fifteen", "charlie")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      pie.add_ingredient("crust")
      expect(pie.ingredients).to eq(["crust"])
      pie.add_ingredient("chocolate")
      expect(pie.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      pie.add_ingredient("eggs")
      pie.add_ingredient("sugar")
      pie.add_ingredient("apples")
      pie.add_ingredient("herbs")
      pie.add_ingredient("milk")
      pre_mix = pie.ingredients.dup
      pie.mix!
      expect(pie.ingredients).not_to eq(pre_mix)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      expect(pie.eat(1)).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect{pie.eat(3)}.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return(:"Chef chef the Great Baker")
      expect(pie.serve).to include("Chef chef the Great Baker")

    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(pie)
      
    end
  end
end

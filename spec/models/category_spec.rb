require 'rails_helper'

RSpec.describe Category, type: :model do
  context "the categpry is valid" do
    it "has a name" do
      category = Category.create!(name: "rspec test")
      expect(category.name).to eq("rspec test")
    end

    it "can have multiple products" do
      category = Category.create!(name: "test")
      product_1 = Product.create!(title: "rspec test 1", description: "testing my first test")
      product_2 = Product.create!(title: "rspec test 2", description: "testing my second test")
      category.products << product_1
      category.products << product_2
      expect(category.reload.products).to eq([product_1, product_2])
    end

    describe '#name' do
      it "it is not valid without a name" do
        category = Category.new
        category.name = ""
        category.valid?
        category.errors[:name].should include("can't be blank")
      end
    end
  end
end

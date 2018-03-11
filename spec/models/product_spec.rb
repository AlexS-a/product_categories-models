require 'rails_helper'

RSpec.describe Product, type: :model do
  context "the product is valid" do
    it "has a title and a description" do
      product = Product.create!(title: "rspec test", description: "testing my first test")
      expect(product.title).to eq("rspec test")
      expect(product.description).to eq("testing my first test")
    end


    it "can have multiple categories" do
      product = Product.create!(title: "rspec test", description: "testing my first test")
      category_1 = Category.create!(name: "1")
      category_2 = Category.create!(name: "2")
      product.categories << category_1
      product.categories << category_2
      expect(product.reload.categories).to eq([category_1, category_2])
    end
    describe '#title' do
      it "it is not valid without a title" do
        product = Product.new
        product.title = ""
        product.valid?
        product.errors[:title].should include("can't be blank")
      end
    end
    describe '#description' do
      it "it is not valid without a description" do
        product = Product.new
        product.description = ""
        product.valid?
        product.errors[:description].should include("can't be blank")
      end
    end
  end
end

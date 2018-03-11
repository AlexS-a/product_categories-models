require 'rails_helper'

RSpec.describe "products/index.html.erb" do
  it "displays all the products" do
    assign(:products, [
      Product.create!(title: "test_1", description: "1 quick test"),
      Product.create!(title: "test_2", description: "2 quick test"),
    ])

    render

    expect(rendered).to match /test_1/
    expect(rendered).to match /test_2/
  end

  it "has a link to create a product" do
    assign(:products, [
      Product.create!(title: "test_1", description: "1 quick test"),
      Product.create!(title: "test_2", description: "2 quick test"),

    ])

    render

    expect(rendered).to include("Create a new product")
  end

  it "has a link back to home page" do
    assign(:products, [
      Product.create!(title: "test_1", description: "1 quick test"),
      Product.create!(title: "test_2", description: "2 quick test"),
    ])

    render

    expect(rendered).to include("Back to home page")
  end
end

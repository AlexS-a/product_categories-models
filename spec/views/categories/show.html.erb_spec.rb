require 'rails_helper'


RSpec.describe "categories/show.html.erb" do
  it "display the category" do
    assign(:category,
      Category.create!(name: "test_1"))
    assign(:products, [
      Product.create!(title: "testing_1", description: "just a quick test 1"),
      Product.create!(title: "testing_2", description: "just another quick test")
      ])

    render

    expect(rendered).to match /test_1/
    expect(rendered).to match /testing_1/
  end

  it "display the products" do
    assign(:category,
      Category.create!(name: "test_1"))
    assign(:products, [
      Product.create!(title: "testing_1", description: "just a quick test 1"),
      Product.create!(title: "testing_2", description: "just another quick test")
      ])

    render

    expect(rendered).to match /testing_2/
    expect(rendered).to match /testing_1/
  end
end

require 'rails_helper'

RSpec.describe "categories/index.html.erb" do
  it "displays all the categories" do
    assign(:categories, [
      Category.create!(name: "test_1"),
      Category.create!(name: "test_2")
    ])

    render

    expect(rendered).to match /test_1/
    expect(rendered).to match /test_2/
  end

  it "has a link to create a category" do
    assign(:categories, [
      Category.create!(name: "test_1"),
      Category.create!(name: "test_2")
    ])

    render

    expect(rendered).to include("Create a new category")
  end

  it "has a link back to home page" do
    assign(:categories, [
      Category.create!(name: "test_1"),
      Category.create!(name: "test_2")
    ])

    render

    expect(rendered).to include("Back to home page")
  end
end

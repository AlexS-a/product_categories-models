require 'rails_helper'

RSpec.describe "pages/home.html.erb" do
  it "has a link to all categories" do
    render
    expect(rendered).to include("View all the categories")
  end

  it "has a link to all products" do
    render
    expect(rendered).to include("View all products")
  end

  it "has a link to create a category" do
    render
    expect(rendered).to include("Create a new category")
  end

  it "has a link to create a product" do
    render
    expect(rendered).to include("Create a new product")
  end
end

RSpec.describe "products/show.html.erb" do
  it "display the products" do
    assign(:product,
      Product.create!(title: "testing_1", description: "just a quick test 1"))
    assign(:categories, [
      Category.create!(name: "test_1"),
      Category.create!(name: "test_2")
      ])

    render

    expect(rendered).to match /testing_1/
  end

  it "display the categories" do
    assign(:product,
      Product.create!(title: "testing_1", description: "just a quick test 1"))
    assign(:categories, [
      Category.create!(name: "test_1"),
      Category.create!(name: "test_2")
      ])

    render

    expect(rendered).to match /test_1/
    expect(rendered).to match /test_2/
  end
end

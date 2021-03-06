class Product < ApplicationRecord
  has_many :product_categories,  dependent: :destroy
  has_many :categories, through: :product_categories

  validates :title, presence: true
  validates :description, presence: true
end

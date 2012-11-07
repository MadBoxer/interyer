class Product < ActiveRecord::Base
  has_many :products_categories#, :class_name => "ProductsCategories"
  has_many :categories, :through => :products_categories
  #has_and_belongs_to_many :category
end

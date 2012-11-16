class Product < ActiveRecord::Base
  has_many :products_categories#, :class_name => "ProductsCategories"
  has_many :categories, :through => :products_categories
  has_many :cart_items
  has_many :product_images
  
  scope :avail, ->(cond){Product.where(:active => true, :trash => false).where(cond)}
  
  mount_uploader :image, PictureUploader
end
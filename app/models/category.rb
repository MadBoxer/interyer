class Category < ActiveRecord::Base
  
  has_many :products_categories#, :class_name => "ProductsCategories"
  has_many :products, :through => :products_categories
  #has_and_belongs_to_many :products
  
  has_many :categories, :foreign_key => :parent_id
  belongs_to :category
  
  validates_presence_of :name
  
  mount_uploader :image, PictureUploader
  
  private #-----------------
  
  
end

class Category < ActiveRecord::Base
  
  has_many :products_categories#, :class_name => "ProductsCategories"
  has_many :products, :through => :products_categories
  #has_and_belongs_to_many :products
  
  has_many :categories, :foreign_key => :parent_id
  belongs_to :category
  belongs_to :parent, :foreign_key => :parent_id, :class_name => 'Category'

  validates :name, :single_name, :presence => true

  scope :root, ->(cond = nil){where(:parent_id => 0).where(cond)}
  
  mount_uploader :image, PictureUploader

  def self.get_by_params(params)
    if params[:cat_ref]
      category = Category.where(:alias => params[:cat_ref]).first
    else
      if params[:id]
        category = Category.find(params[:id])
      end
    end
    category or nil
  end

  def get_children_cats
    Category.where(:parent_id => self.id)
  end

  def get_products
    self.products.avail
  end
  private #-----------------
  
  
end

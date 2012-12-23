class Product < ActiveRecord::Base

  validates :name, :article, :price, :alias, :brand, :presence => true

  has_many :products_categories#, :class_name => "ProductsCategories"
  has_many :categories, :through => :products_categories
  has_many :cart_items
  has_many :orders, :through => :cart_items
  
  has_many :product_images
  
  has_many :products_actions, :class_name => "ProductsAction"
  has_many :actions, :through => :products_actions

  has_and_belongs_to_many :surfaces

  belongs_to :brand

  belongs_to :discount


  
  scope :avail, ->(cond = nil){Product.where(:active => true, :trash => false).where(cond)}
  
  def admin_update_images(params)
    self.admin_set_main_image(params['main_product_image'])

    if params['product_image']
      args = self.product_images.empty? ? {:image => params['product_image'], :main => true} : {:image => params['product_image']}
      self.product_images.push ProductImage.new_based_on_data(args)
    end
    
  end
  
  def admin_set_main_image(image_id)
    self.product_images.collect!{|image| image.id.to_s == image_id ? image.main = true : image.main = false; image.save; image}
  end

  def self.get(params)
    get_cat = ->(params){
      if params[:cat_ref]
        if params[:prod_ref]
          cat = Category.avail(:alias => params[:cat_ref]).first
        end
        if params[:id]
          cat = Category.avail(:alias => params[:cat_ref]).first
        end
      end
      cat or nil
    }
    @cat = get_cat.call(params)
    if @cat
      product = @cat.products.avail(:alias => params[:prod_ref]).first
    else
      if params[:prod_ref]
        product = Product.where(:alias => params[:prod_ref]).first
      else
        if params[:id]
          product = Product.find(params[:id])
        end
      end
    end
    product
  end

  def self.search(value)
    Product.where('name LIKE \'%'+value+'%\' or id = \'' + value + '\' or description LIKE \'%' + value + '%\'')
  end

end
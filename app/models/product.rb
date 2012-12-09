class Product < ActiveRecord::Base
  has_many :products_categories#, :class_name => "ProductsCategories"
  has_many :categories, :through => :products_categories
  has_many :cart_items
  
  has_many :product_images
  
  has_many :products_actions, :class_name => "ProductsAction"
  has_many :actions, :through => :products_actions
  
  scope :avail, ->(cond){Product.where(:active => true, :trash => false).where(cond)}
  
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
end
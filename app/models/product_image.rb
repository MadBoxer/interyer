class ProductImage < ActiveRecord::Base
  
  belongs_to :product
  
  mount_uploader :name, PictureUploader
  
  def self.new_based_on(name)
    p = self.new
    p.name = name
    p
  end
end

class ProductImage < ActiveRecord::Base
  
  belongs_to :product
  
  scope :main, lambda{where(:main => true)}
  mount_uploader :name, PictureUploader
  
  def self.new_based_on(file, main=false)
    p = self.new
    p.name = file
    p.main = main
    p
  end
  
  def self.new_based_on_data(args)
    p = self.new
    p.name = args[:image]
    p.main = args[:main] ? args[:main] : false
    p
  end
  
end

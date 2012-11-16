class CartItem < ActiveRecord::Base
  belongs_to :product
  
  def self.new_based_on(product)
    item = self.new
    item.product = product
    item.quantity = 1
    return item
  end
end

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :products, :through => :cart_items
  validate :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validate :phone, :format => {:with => /^[0-9]{11}$/i}
  
  attr_accessor :total_sum

  def get_total
    self.cart_items.inject(0.0){|sum, item| sum + item.product.price*item.quantity}
  end
end

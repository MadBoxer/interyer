class ProductImage < ActiveRecord::Base
  
  belongs_to :product
  scope :mini, lambda(cond) {|type| where(:type => 'mini').where(cond)}
  scope :medium, lambda(cond) {|type| where(:type => 'medium').where(cond)}
  scope :large, lambda(cond) {|type| where(:type => 'large').where(cond)}
end

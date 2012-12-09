class Action < ActiveRecord::Base
  has_many :products_actions, :class_name => "ProductsAction"
  has_many :products, :through => :products_actions
  validates_presence_of :name
  
  scope :active, ->(cond=nil){where(:active => true).where(cond)}
end

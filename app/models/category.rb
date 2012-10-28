class Category < ActiveRecord::Base
  has_many :categories, :foreign_key => :parent_id
  belongs_to :category
  
  validates_presence_of :name
end

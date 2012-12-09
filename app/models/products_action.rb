class ProductsAction < ActiveRecord::Base
  belongs_to :product
  belongs_to :action
end

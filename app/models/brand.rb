class Brand < ActiveRecord::Base
  validates :name, :presence => true
  has_many :products

  mount_uploader :avatar, BrandUploader
end

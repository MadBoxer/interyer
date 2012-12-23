class Surface < ActiveRecord::Base
  validates :name, :avatar, :presence => true
  has_and_belongs_to_many :products

  mount_uploader :avatar, SurfaceUploader
end

class Advantage < ActiveRecord::Base
  validates_presence_of :name, :avatar, :announce
  
  mount_uploader :avatar, AdvantageUploader
end

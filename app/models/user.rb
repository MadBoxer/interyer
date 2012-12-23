class User < ActiveRecord::Base
  
  has_many :orders
  validates :fio, :fio, :password, :presence => true
  validates :email, :uniqueness => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :password, :presence =>true, :confirmation =>true
  validate :phone, :uniqueness => true, :format => {:with => /^[0-9]{11}$/i}
    
  def self.new_based_on(args)
    user = self.new
    user.email = args[:email]
    user.fio = args[:fio]
    user.password = args[:password]
    user.save
  end
  
  
end
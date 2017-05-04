class User < ActiveRecord::Base

  has_many :rides
  has_many :attractions, through: :rides

  validates_confirmation_of :password

  # attr_accessible :attribute1, attribute2

end

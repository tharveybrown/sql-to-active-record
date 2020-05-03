class User < ActiveRecord::Base
  has_many :rides
  has_many :services, through: :rides
end
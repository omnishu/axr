class User < ApplicationRecord

  SITES_LIMIT = 3

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sites
  validates_each :sites do |user, attr, value|
    user.errors.add attr, 'Too much sites for user' if user.sites.size > SITES_LIMIT
  end
end

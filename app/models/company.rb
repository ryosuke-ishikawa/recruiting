class Company < ActiveRecord::Base
  has_many :company_users
  belongs_to :prefecture
end

class Address < ActiveRecord::Base
    belongs_to :student
    belongs_to :prefecture
end

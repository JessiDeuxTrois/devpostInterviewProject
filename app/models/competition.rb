class Competition < ApplicationRecord
  belongs_to :users, optional: true
  has_many :prizes
  
end

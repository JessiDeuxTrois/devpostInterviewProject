class Prize < ApplicationRecord
  belongs_to :competitions, optional: true

end

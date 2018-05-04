class Cat < ApplicationRecord
  belongs_to :hoomin
  has_one :dog, through: :hoomin, inverse_of: :cat
end

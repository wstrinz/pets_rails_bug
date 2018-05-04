class Dog < ApplicationRecord
  belongs_to :hoomin
  has_one :cat, through: :hoomin, inverse_of: :dog
end

class Cat < ApplicationRecord
  belongs_to :person
  has_one :dog, through: :person, inverse_of: :cat
end

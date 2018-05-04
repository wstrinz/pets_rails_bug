class Dog < ApplicationRecord
  belongs_to :person
  has_one :cat, through: :person, inverse_of: :dog
end

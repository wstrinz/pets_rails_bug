class Person < ApplicationRecord
  has_one :cat
  has_one :dog
end

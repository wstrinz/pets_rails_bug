require 'test_helper'

class CatTest < ActiveSupport::TestCase
  test "associations" do
    person = Person.create!(name: "name")
    Dog.create!(name: "dog", person: person)
    cat = Cat.create!(name: "cat", person: person)

    cat.dog.update!(name: "notdog")
    assert_equal cat.dog.name, "notdog"
  end
end

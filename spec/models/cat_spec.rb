require 'rails_helper'

RSpec.describe Cat, type: :model do
  let!(:hoomin) { Hoomin.create(name: "foosef") }
  let!(:dog) { Dog.create(name: "barkley", hoomin: hoomin) }
  let!(:cat) { Cat.create(name: "cumbie", hoomin: hoomin) }

  it "has hoomin" do
    expect(cat.hoomin).to eq(hoomin)
  end

  it "has dog" do
    expect(cat.dog).to eq(dog)
  end

  it "can update dog name" do
    cat.dog.update!(name: "fwuffy")
  end
end

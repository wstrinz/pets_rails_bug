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

  it "raises stack error when updating through instance reference" do
    expect{cat.dog.update!(name: "fwuffy")}.to raise_error(SystemStackError)
  end

  it "raises stack error when calls are not chained" do
    d = cat.dog
    expect{d.update!(name: "fwuffy")}.to raise_error(SystemStackError)
  end

  it "does not raise stack error when reloading before updating" do
    cat.dog.reload.update!(name: "fwuffy")
    expect(cat.dog.name).to eq("fwuffy")
  end
end

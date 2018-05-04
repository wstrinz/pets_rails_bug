require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Person.create(name: 'personman') }

  it 'has name' do
    expect(person.name).to eq('personman')
  end
end

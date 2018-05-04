require 'rails_helper'

RSpec.describe Hoomin, type: :model do
  let(:hoomin) { Hoomin.create(name: 'personman') }

  it 'has name' do
    expect(hoomin.name).to eq('personman')
  end
end

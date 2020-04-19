require 'rails_helper'

RSpec.describe Genre, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:genre)).to be_valid
  end

  it 'is valid with a product' do
    expect(create(:genre_with_product)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:genre, name: nil)).to_not be_valid
  end

  it 'is not valid when name already taken' do
    create(:genre, name: 'Metal')

    expect { create(:genre, name: 'Metal') }.to raise_error('Validation failed: Name has already been taken')
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:product)).to be_valid
  end

  it 'is valid with a genre' do
    expect(create(:product_with_genre)).to be_valid
  end

  it 'is not valid without a title' do
    expect(build(:product, title: nil)).to_not be_valid
  end

  it 'is not valid when name already taken' do
    create(:product, title: 'Dup name')

    expect { create(:product, title: 'Dup name') }.to raise_error('Validation failed: Name has already been taken')
  end
end

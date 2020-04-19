require 'rails_helper'

RSpec.describe Label, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:label)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:label, name: nil)).to_not be_valid
  end

  it 'is not valid when name already taken' do
    create(:genre, name: 'Blood Music')

    expect { create(:genre, name: 'Blood Music') }.to raise_error('Validation failed: Name has already been taken')
  end
end

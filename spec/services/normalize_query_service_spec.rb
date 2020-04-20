require 'rails_helper'

describe NormalizeQueryService do
  subject { described_class.new(params).call }

  context 'params with separator' do
    let(:params) { 'genre:Metal label:New product:album' }
    let(:valid_result) do
      [
        { association_name: :genre, query_value: 'Metal' },
        { association_name: :label, query_value: 'New' },
        { association_name: :product, query_value: 'album' }
      ]
    end

    it 'normalizes association string' do
      expect(subject).to eq(valid_result)
    end
  end

  context 'params with & without separator' do
    let(:params) { 'genre:Metal Album' }
    let(:valid_result) do
      [
        { association_name: :genre, query_value: 'Metal' },
        { association_name: :product, query_value: 'Album' }
      ]
    end

    it 'normalizes association string' do
      expect(subject).to eq(valid_result)
    end
  end

  context 'params without separator' do
    let(:params) { 'last Album collection' }
    let(:valid_result) do
      [
        { association_name: :product, query_value: 'last' },
        { association_name: :product, query_value: 'Album' },
        { association_name: :product, query_value: 'collection' }
      ]
    end

    it 'normalizes association string' do
      expect(subject).to eq(valid_result)
    end
  end

  context 'empty query' do
    let(:params) { '' }
    let(:valid_result) { [] }

    it 'normalizes association string' do
      expect(subject).to eq(valid_result)
    end
  end
end

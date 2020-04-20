require 'rails_helper'

describe ProductsSearchService do
  subject { described_class.new(params).call }

  context 'valid genre association params' do
    let(:searched_genre_name) { 'metal' }
    let!(:genre_with_product1) { create(:genre_with_product, name: searched_genre_name) }
    let!(:genre_with_product2) { create(:genre_with_product, name: 'synth') }

    let(:params) { { association_name: :genre, query_value: searched_genre_name } }

    it 'returns proper product according to genre' do
      expect(subject).to eq(genre_with_product1.products)
    end
  end

  context 'valid label association params' do
    let(:searched_label) { create(:label, name: 'Blood-music') }
    let(:other_label) { create(:label, name: 'Monnom') }

    let!(:product_with_label1) { create(:product, label: searched_label) }
    let!(:product_with_label2) { create(:product, label: other_label) }

    let(:params) { { association_name: :label, query_value: searched_label.name } }

    it 'returns empty array for invalid association' do
      result = subject

      expect(result[0].label).to eq(searched_label)
      expect(result.count).to eq(1)
    end
  end

  context 'invalid association params' do
    let(:genre_with_product1) { create(:genre_with_product, name: 'metal') }
    let(:genre_with_product2) { create(:genre_with_product, name: 'synth') }

    let(:params) { { association_name: :invalid_scope, query_value: 'metal' } }

    it 'returns empty array for invalid association' do
      expect(subject).to eq([])
    end
  end
end

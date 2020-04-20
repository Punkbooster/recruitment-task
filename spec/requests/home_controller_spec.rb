require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe 'GET index' do

    subject { @controller.instance_variable_get(:@products) }

    context 'without search query' do
      it 'returns a successful response' do
        get root_path

        expect(response).to be_successful
      end

      it 'assigns @products' do
        product = create(:product)

        get root_path

        expect(subject).to include(product)
      end

      it 'assigns empty array when no products' do
        get root_path

        expect(subject).to be_empty
      end
    end

    context 'with search query' do
      let!(:product1) { create(:product, title: 'Vynil Collection') }
      let!(:product2) { create(:product, title: 'CD EP') }
      let!(:product3) { create(:product, title: 'T-shirt') }

      it 'returns a product that matches query' do
        get root_path, params: { q: 'cd' }

        result = subject

        expect(result.count).to eq(1)
        expect(result).to include(product2)
      end

      it 'returns all products in case of empty query' do
        get root_path, params: { q: '' }

        expect(subject).to include(product1, product2, product3)
      end

      context 'association query' do
        let(:searched_genre_name) { 'Metal' }
        let!(:genre) { create(:genre, name: searched_genre_name, products: [product1]) }

        it 'returns product by genre search' do
          get root_path, params: { q: 'genre:Metal' }

          result = subject

          expect(result.count).to eq(1)
          expect(result[0].genres).to include(genre)
        end
      end
    end
  end
end

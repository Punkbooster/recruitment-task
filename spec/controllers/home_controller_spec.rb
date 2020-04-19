require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    context 'without search query' do
      it 'returns a successful response' do
        get :index

        expect(response).to be_success
      end

      it 'assigns @products' do
        product = create(:product)

        get :index

        expect(@controller.instance_variable_get(:@products)).to include(product)
      end

      it 'assigns empty array when no products' do
        get :index

        expect(@controller.instance_variable_get(:@products)).to be_empty
      end
    end

    context 'with search query' do
      let!(:product1) { create(:product, title: 'Vynil Collection') }
      let!(:product2) { create(:product, title: 'CD EP') }
      let!(:product3) { create(:product, title: 'T-shirt') }

      it 'returns a product that matches query' do
        get :index, params: { search_query: 'cd' }

        expect(@controller.instance_variable_get(:@products)).to include(product2)
        expect(@controller.instance_variable_get(:@products)).to_not include([product1, product3])
      end

      it 'returns empty array in case of empty query' do
        get :index, params: { search_query: '' }

        expect(@controller.instance_variable_get(:@products)).to be_empty
      end

      context 'association query' do
        let!(:genre) { create(:genre, products: [product1]) }

        it 'returns product by genre search' do
          get :index, params: { search_query: 'genre:Metal' }

          expect(@controller.instance_variable_get(:@products)).to include(product1)
        end
      end
    end
  end
end

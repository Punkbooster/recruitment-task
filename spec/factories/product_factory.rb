FactoryBot.define do
  factory :product, class: Product do
    title { 'Chaos Come To Conquer EP' }
    description { 'Sample description' }
    released_at { Time.now - 30.days }
    price { 10 }
    label

    factory :product_with_genre do
      after(:create) do |product|
        create(:genre, products: [product])
      end
    end
  end
end

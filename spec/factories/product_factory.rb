FactoryBot.define do
  factory :product, class: Product do
    title { Faker::Music.unique.album }
    released_at { Faker::Date.in_date_period }
    price { Faker::Commerce.price }
    label { Label.last || build(:label) }

    factory :product_with_genre do
      after(:create) do |product|
        create(:genre, products: [product])
      end
    end
  end
end

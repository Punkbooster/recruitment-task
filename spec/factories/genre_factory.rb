FactoryBot.define do
  factory :genre, class: Genre do
    name { 'Synthwave' }
    description { 'Sample description' }

    factory :genre_with_product do
      after(:create) do |genre|
        create(:product, genres: [genre])
      end
    end
  end
end

FactoryBot.define do
  factory :genre, class: Genre do
    name { Faker::Music.genre }

    factory :genre_with_product do
      after(:create) do |genre|
        create(:product, genres: [genre])
      end
    end
  end
end

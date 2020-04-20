FactoryBot.define do
  factory :label, class: Label do
    name { Faker::Music.unique.instrument }
  end
end

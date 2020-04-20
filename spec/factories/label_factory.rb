FactoryBot.define do
  factory :label, class: Label do
    name { Faker::Music.instrument }
  end
end

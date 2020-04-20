ActiveRecord::Base.transaction do
  ProductGenre.delete_all
  Product.delete_all
  Genre.delete_all
  Label.delete_all

  (1...5).each do
    Label.create!(name: Faker::Music.unique.instrument)
  end

  (1...5).each do
    Genre.create!(
      name: Faker::Music.unique.genre
    )
  end

  (1...5).each do
    Product.create!(
      title: Faker::Music.unique.album,
      released_at: Faker::Date.in_date_period,
      label: Label.all.sample,
      price: Faker::Commerce.price,
      genres: [Genre.all.sample]
    )
  end
end

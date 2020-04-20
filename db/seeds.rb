ActiveRecord::Base.transaction do
  ProductGenre.delete_all
  Product.delete_all
  Genre.delete_all
  Label.delete_all

  %i[Monnom Blood-music Roadrunner].each do |label_name|
    Label.create!(name: label_name)
  end

  product_names = [
    'Perturbator New Model Album',
    'Carpenter Vice EP',
    'Gost T-shirt',
    'Attila About That Life Album'
  ]

  product_names.each_with_index do |name, index|
    Product.create!(
      title: name,
      released_at: Time.now - 1.month,
      label: Label.all.sample,
      price: 10 + index
    )
  end

  genre_names = [
    'Metal',
    'Synthwave',
    'Techno'
  ]
  genre_names.each do |name|
    Genre.create!(
      name: name,
      products: [Product.all.sample]
    )
  end
end

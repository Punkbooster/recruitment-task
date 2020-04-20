genre_names = [
  'Metal',
  'Synthwave',
  'Techno'
]
genre_names.each do |name|
  Genre.create(
    name: name,
    description: 'Some description',
    products: [Product.all.sample]
  )
end

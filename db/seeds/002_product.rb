product_names = [
  'Perturbator New Model Album',
  'Carpenter Vice EP',
  'Gost T-shirt',
  'Attila About That Life Album'
]

product_names.each_with_index do |name, index|
  Product.create(
    title: name,
    released_at: Time.now - 1.month,
    description: 'sample description',
    label: Label.all.sample,
    price: 10 + index
  )
end

ProductGenre.delete_all
Product.delete_all
Genre.delete_all
Label.delete_all

%i[Monnom Blood-music Roadrunner].each do |label_name|
  Label.create(name: label_name)
end

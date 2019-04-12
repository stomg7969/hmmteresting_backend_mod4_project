# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product_images = [
  "https://cdn.shopify.com/s/files/1/0627/5517/products/Chrono-S-Blue_Brown_2048x2048.jpg?v=1542911430",
  'https://images-na.ssl-images-amazon.com/images/I/41ABae0hT0L._SY300_QL70_.jpg',
  'https://target.scene7.com/is/image/Target/GUEST_c918b5e1-2437-4582-a743-e1d4751d6943?wid=488&hei=488&fmt=pjpeg',
  'https://i5.walmartimages.ca/images/Large/010/121/6000199010121.jpg',
  'https://static.toiimg.com/photo/64867631/Reliance-JioPhone-2.jpg',
  'https://target.scene7.com/is/image/Target/GUEST_bce97061-4080-4e6a-a1ea-df60d13c8db1?wid=488&hei=488&fmt=pjpeg',
  'https://i.kinja-img.com/gawker-media/image/upload/s--SD1kpjEX--/kr8drnt69ztcvhg9mufc.jpg',
  'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/6/0/FN_snapchat_coachella_wingman%20.jpeg.rend.hgtvcom.616.462.suffix/1523633513292.jpeg',
  'https://images-na.ssl-images-amazon.com/images/I/71Nz7k%2BmMgL._SY679_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/41XF4YV7JQL._SX425_.jpg',
  'http://www.portableone.com/images/angled_original_imac_medium.png',
  'https://cf.geekdo-images.com/opengraph/img/bzauqMWKdcKaoguixSOZqdRZzuc=/fit-in/1200x630/pic338410.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/61Rmn8lioaL._SX466_.jpg',
  'http://www.papercraftsquare.com/wp-content/uploads/2016/11/MechWarrior-4-Mad-Dog-Vulture-Mech-Paper-Model.jpg'
]


Company.destroy_all
5.times do
  Company.create(name: "#{Faker::Company.name} #{Faker::Company.suffix}", catch_phrase: Faker::Company.catch_phrase, logo: Faker::Company.logo, password: "aaa")
end

Product.destroy_all

10.times do
  Product.create(name: Faker::Commerce.product_name, company_id: (Random.rand(4) + 1), quota: 1000, completed: false, category: Faker::Commerce.department(1), description: Faker::Lorem.paragraph(10), img: product_images[Random.rand(13)])
end

User.destroy_all

20.times do
  User.create(username: Faker::Internet.unique.username, email: Faker::Internet.free_email, img: Faker::Avatar.image, password: "aaa")
end

Interest.destroy_all

10.times do
  Interest.create(user_id: (Random.rand(19)+1), product_id: (Random.rand(9)+1))
end

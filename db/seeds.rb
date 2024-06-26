require 'faker'

Admin.destroy_all
Restaurant.destroy_all


10.times do
  admin = Admin.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password
  )
end

12.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    description: Faker::Restaurant.description,
    city: ['Paris', 'Marseille', 'Toulouse', 'Lyon', 'Bordeaux', 'Lille', 'Montpellier', 'Nice', 'Rennes', 'Rouen', 'Strasbourg', 'Reims'].sample,
    food: ['Chinese', 'Japanese', 'Italian', 'French', 'Lebanese', 'Mediterranean', 'Greek', 'Mexican', 'Indian', 'Thaï', 'Korean', 'Vegetarian', 'Fast food'].sample,
    admin_id: Admin.pluck(:id).sample
  )

  restaurant.photo.attach( io: File.open(Rails.root.join('db/images/restau.avif')),
  filename: 'restau.avif')
end
require 'faker'

Property.destroy_all
User.destroy_all

puts "Start seeding! 🐑"
puts 'Start generate users ✨'

users = User.create([{ email: "test0@mail.com", password: "123456" , name: "Dulces",  phone: "900900901", role: 0 },
            { email: "test1@mail.com", password: "123456" , name: "Morrito", phone: "900900902", role: 1 },
            { email: "test2@mail.com", password: "123456" , name: "El Traidor", phone: "900900903", role: 1 },
            { email: "test3@mail.com", password: "123456" , name: "Jose", phone: "900900904", role: 0 },
            { email: "test4@mail.com", password: "123456" , name: "Martos", phone: "900900905", role: 1 }
            ]) 
puts 'End generate users! 😌'

puts 'Start generate properties 😎'

landlords = users.filter{|user| user.role == "landlord"}

landlords.each do |landlord|
  rand(2..10).times do
    property_params = {
      user_id: landlord.id,
      address: Faker::Address.full_address,
      price: 10*rand(50..100),
      area: 1.72*rand(68..100),
      beds: rand(1..3),
      baths: rand(1..4),
      description: Faker::Lorem.paragraph_by_chars(number: 120),
      status: rand(0..1),
      property_type: rand(0..1),
      operation_type: rand(0..1)
    }
    property = Property.create(property_params)
    # puts 'Adding photos 📷'
    # rand(1..3).times do
    #   number = rand(1..27)
    #   photo_number = number < 9 ? "0#{number+1}" : number + 1
    #   property.photos.attach(io: File.open("app/photos/#{photo_number}.jpg"), filename: "#{photo_number}.jpg")
    # end
  end
end
puts 'End generate properties!'

puts 'Updating to pets allowed properties'

on_sale_properties = Property.all.filter{|property| property.operation_type == "sale"}
on_rent_properties = Property.all.filter{|property| property.operation_type == "rent"}

on_sale_properties.each do |property|
  property.update(pets: true)
end  

on_rent_properties.each do |property|
  property.update(pets: [true, false].sample)
end

puts 'Updating maintenance'

on_rent_properties.each do |property|
  property.update(maintenance: 0.1*property.price)
end

puts 'Creating properties marked as favorites'

users.each do |user|
  rand(0..3).times do
    Favorite.create(user: user, property: Property.all.sample)
  end
end

puts 'Creating contacted properties'

users.each do |user|
  rand(0..3).times do
    Contact.create(user: user, property: Property.all.sample)
  end
end
puts 'Seeding finished! 👌'
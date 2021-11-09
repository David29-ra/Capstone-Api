# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Property.destroy_all
User.destroy_all

user1 = User.create(email: "dulces123@mail.com", password: "123456", name: 'Dulces', phone: "912900900", role: 0) 
user2 = User.create(email: "morrito@mail.com", password: "123456", name: 'Morrito', phone: "933900900", role: 1)
user3 = User.create(email: "moxxito@mail.com", password: "323456", name: 'Morrito', phone: "933960900", role: 1)

Property.create(user_id: user1.id, operation_type: 0, status: 0, address: "la molina", price: 0, property_type:0, area: 123, description: "")
Property.create(user_id: user2.id, operation_type: 0, status: 0, address: "smp", price: 0, property_type:0, area: 123, description: "")
Property.create(user_id: user3.id, operation_type: 0, status: 0, address: "la victoria", price: 0, property_type:0, area: 123, description: "")
Property.create(user_id: user3.id, operation_type: 0, status: 0, address: "ate", price: 0, property_type:0, area: 123, description: "")
Property.create(user_id: user3.id, operation_type: 0, status: 0, address: "comas", price: 0, property_type:0, area: 123, description: "")
Property.create(user_id: user2.id, operation_type: 0, status: 0, address: "runrun", price: 0, property_type:0, area: 123, description: "")
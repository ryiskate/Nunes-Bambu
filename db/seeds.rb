# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

User.create(first_name: 'Ricardo', email: 'ricardo@email.com', password: '123456')
luminarias = Category.create(name: 'Luminárias')
utencilios_de_cozinha = Category.create(name: 'Utencilios de cozinha')
Product.create(name: 'Luminaria', price: 23, description: 'Luminaria 1', category: luminarias)
Product.create(name: 'Colher', price: 10, description: 'Colher 1', category: utencilios_de_cozinha)
Product.create(name: 'Chaveiro', price: 1, description: 'Chaveiro 1', category: utencilios_de_cozinha)
Product.create(name: 'Colher', price: 10, description: 'Colher 1', category: utencilios_de_cozinha)
Product.create(name: 'Chaveiro', price: 1, description: 'Chaveiro 1', category: utencilios_de_cozinha)
Product.create(name: 'Colher', price: 10, description: 'Colher 1', category: utencilios_de_cozinha)
Product.create(name: 'Chaveiro', price: 1, description: 'Chaveiro 1', category: utencilios_de_cozinha)
Product.create(name: 'Colher', price: 10, description: 'Colher 1', category: utencilios_de_cozinha)
Product.create(name: 'Chaveiro', price: 1, description: 'Chaveiro 1', category: utencilios_de_cozinha)
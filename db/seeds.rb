# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

# Task 1 :: Create default super admin user
Spree::Role.create!([
  { name: 'super_admin'},
  { name: 'normal' }
])

Spree.user_class.create({
  email: "superadmin@spree.com",
  password: "12345678",
  password_confirmation: "12345678"
})
Spree.user_class.find_by_email("superadmin@spree.com").spree_roles << Spree::Role.find_or_create_by(name: 'super_admin')


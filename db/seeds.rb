# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pasta.delete_all
Subscription.delete_all

Pasta.create!(name: 'Gnocci')
Pasta.create!(name: 'Orecchiette')
Pasta.create!(name: 'Fusili')
Pasta.create!(name: 'Penne')
Pasta.create!(name: 'Tortiglioni')

Subscription.create!(name: '2 packs plan', monthly_price: 15)
Subscription.create!(name: '4 packs plan', monthly_price: 25)

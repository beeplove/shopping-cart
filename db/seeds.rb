# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create([
  { id: 1, name: 'order received' },
  { id: 2, name: 'waiting for delivery' },
  { id: 3, name: 'on its way' },
  { id: 4, name: 'delivered' }
])

Unit.create([
  { id: 1, name: 'oz', description: 'weight by ounce'},
  { id: 2, name: 'lb', description: 'weight by pound'},
  { id: 3, name: 'pc', description: 'count by pieces'},
  { id: 4, name: 'dz', description: 'count by 12 pieces'}
])

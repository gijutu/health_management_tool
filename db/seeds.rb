# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'Sendai_1 User',
             email: 'abcd@efg.com',
             password: 'foobar0101',
             password_confirmation: 'foobar0101')

User.create!(name: 'Sendai_2 User',
            email: 'hijk@lmn.com',
            password: 'foobar0101',
            password_confirmation: 'foobar0101')

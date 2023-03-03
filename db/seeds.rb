# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

[
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    headline: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.decimal(l_digits: 2),
    address: "73 Bd de la Croisette, 06400 Cannes",
    city: "Cannes",
    state: "Alpes-Maritimes",
    country: "France"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    headline: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.decimal(l_digits: 2),
    address: "2 Rue Brougham, 06400 Cannes",
    city: "Cannes",
    state: "Alpes-Maritimes",
    country: "France"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    headline: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.decimal(l_digits: 2),
    address: "6 Rue de Bône, 06400 Cannes",
    city: "Cannes",
    state: "Alpes-Maritimes",
    country: "France"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    headline: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.decimal(l_digits: 2),
    address: "R. Rocha Lima, 139 Centro, Fortaleza, CE",
    city: "Fortaleza",
    state: "CE",
    country: "Brazil"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    headline: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.decimal(l_digits: 2),
    address: "Av. Dom Manuel, 1353 Centro, Fortaleza, CE",
    city: "Fortaleza",
    state: "CE",
    country: "Brazil"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    headline: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Number.decimal(l_digits: 2),
    address: "R. Itamiami, 91 Vila Mariana, São Paulo, SP",
    city: "São Paulo",
    state: "SP",
    country: "Brazil"
  },
].each_with_index do |p, index|
  place = Place.create!(p)
  place.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "place_#{index + 1}.png")), filename: "place_#{index + 1}.png")
end
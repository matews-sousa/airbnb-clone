# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Place.create([
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: "73 Bd de la Croisette, 06400 Cannes",
    city: "Cannes",
    state: "Alpes-Maritimes",
    country: "France"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: "2 Rue Brougham, 06400 Cannes",
    city: "Cannes",
    state: "Alpes-Maritimes",
    country: "France"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: "6 Rue de Bône, 06400 Cannes",
    city: "Cannes",
    state: "Alpes-Maritimes",
    country: "France"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: "R. Rocha Lima, 139 Centro, Fortaleza, CE",
    city: "Fortaleza",
    state: "CE",
    country: "Brazil"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: "Av. Dom Manuel, 1353 Centro, Fortaleza, CE",
    city: "Fortaleza",
    state: "CE",
    country: "Brazil"
  },
  {
    name: Faker::Lorem.words(number: 3).join(" "),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: "R. Itamiami, 91 Vila Mariana, São Paulo, SP",
    city: "São Paulo",
    state: "SP",
    country: "Brazil"
  },
])
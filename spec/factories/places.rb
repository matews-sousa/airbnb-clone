FactoryBot.define do
  factory :place do
    name { "MyString" }
    description { "MyText" }
    price { 9.99 }
    address { "73 Bd de la Croisette, 06400 Cannes" }
    city { "Cannes" }
    state { "Alpes-Maritimes" }
    country { "France" }
  end
end

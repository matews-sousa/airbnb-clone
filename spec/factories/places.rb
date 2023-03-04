FactoryBot.define do
  factory :place do
    name { "MyString" }
    headline { "MyString" }
    description { "MyText" }
    price { 9.99 }
    cleaning_fee { 9.99 }
    max_guests { 1 }
    rooms { 1 }
    beds { 1 }
    baths { 1 }
    min_reservation_days { 1 }
    address_1 { "73 Bd de la Croisette" }
    postal_code { "06400" }
    city { "Cannes" }
    state { "Alpes-Maritimes" }
    country { "France" }
    latitude { 43.5513 }
    longitude { 7.0128 }
    host { build(:user) }
  end
end

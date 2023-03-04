FactoryBot.define do
  factory :user do
    id {1}
    name {"Test User"}
    email {"factory@email.com"}
    password {"password"}
  end
end

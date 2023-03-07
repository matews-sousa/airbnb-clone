FactoryBot.define do
  factory :review do
    vote { 1 }
    content { "MyText" }
    user { nil }
    place { nil }
  end
end

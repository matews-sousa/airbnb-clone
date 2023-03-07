FactoryBot.define do
  factory :review do
    vote { 1 }
    content { "MyText" }
    user { create(:user) }
    place { create(:place) }
  end
end

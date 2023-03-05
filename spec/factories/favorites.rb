FactoryBot.define do
  factory :favorite do
    user { create(:user) }
    place { create(:place) }
  end
end

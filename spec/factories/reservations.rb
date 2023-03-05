FactoryBot.define do
  factory :reservation do
    checkin { "2023-03-05" }
    checkout { "2023-03-10" }
    guests { 1 }
    place { create(:place) }
    user { create(:user) }
  end
end

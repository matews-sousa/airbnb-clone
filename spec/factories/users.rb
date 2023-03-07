FactoryBot.define do
  factory :user do
    before(:create) { |user| user.define_singleton_method(:maybe_set_stripe_customer_id){} }
    id {1}
    first_name {"John"}
    last_name {"Doe"}
    email {"factory@email.com"}
    password {"password"}
  end
end

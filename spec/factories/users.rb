FactoryBot.define do
  factory :user do
    before(:create) { |user| user.class.skip_callback(:create, :after, :maybe_set_stripe_customer_id, raise: false) }
    id {1}
    first_name {"John"}
    last_name {"Doe"}
    email {"factory@email.com"}
    password {"password"}

    trait :host do
      is_host {true}
      id {2}
      email {"factoryhost@email.com"}
    end
  end
end

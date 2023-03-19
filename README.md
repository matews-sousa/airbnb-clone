# 🏠 Airbnb Clone

This is a Ruby on Rails application that serves as a clone of the popular vacation rental platform, Airbnb. The application includes basic features of the real Airbnb such as creating and browsing listings and making reservations.

## 💻 Technologies Used

- Ruby on Rails
- Tailwind CSS
- Stimulus
- Google Places API
- Stripe API
- Stripe Webhooks

## 🚀 Getting Started

To get started with this application, follow these steps:

1. Clone the repository to your local machine.
2. Install the necessary dependencies by running `bundle install`.
3. Set up the database by running `rails db:create` and `rails db:migrate`.
4. Add your secret keys to your Rails Credentials using the following command: `EDITOR="<your_editor> --wait" rails credentials:edit`. This will open
a text editor where you can add your credentials in the following format:
```bash
stripe:
  publishable_key: YOUR_STRIPE_PUBLISHABLE_KEY
  secret_key: YOUR_STRIPE_SECRET_KEY
  webhook_secret_development: YOUR_WEBHOOK_DEVELOPMENT_KEY
  
  (not necessary for development environment)
  webhook_secret_account_production:
  webhook_secret_connect_production:
  
google:
  client_id: YOUR_GOOGLE_CLIENT_ID
  client_secret: YOUR_GOOGLE_CLIENT_SECRET
  api_key: YOUR_GOOGLE_PLACES_API_KEY
  
github:
  client_id: YOUR_GITHUB_CLIENT_ID
  client_secret: YOUR_GITHUB_CLIENT_SECRET
```
5. Start the server by running `bin/dev`.

## 🌟 Features

- User authentication and authorization with email and password, Google or GitHub 
- Creating, browsing, favoriting and reviewing properties
- Making reservations and processing payments with Stripe

## 🤝 Contributing

Contributions are welcome! If you have any ideas for features or improvements, feel free to open an issue or submit a pull request.

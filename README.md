# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe





# <h1>Signup!</h1>

# <div class="container mt-5">
#   <h1 class="mb-4">Sign Up</h1>

#   <%= form_with(model: @user, local: true, class: "needs-validation", novalidate: true) do |f| %>
#     <div class="mb-3">
#       <%= f.label :first_name, class: "form-label" %>
#       <%= f.text_field :name, class: "form-control", required: true %>
#     </div>
#     <div class="mb-3">
#       <%= f.label :last_name, class: "form-label" %>
#       <%= f.text_field :name, class: "form-control", required: true %>
#     </div>

#     <div class="mb-3">
#       <%= f.label :email, class: "form-label" %>
#       <%= f.email_field :email, class: "form-control", required: true %>
#     </div>

#     <div class="mb-3">
#       <%= f.label :password, class: "form-label" %>
#       <%= f.password_field :password, class: "form-control", required: true, minlength: 6 %>
#     </div>

#     <div class="mb-3">
#       <%= f.label :password_confirmation, "Confirm Password", class: "form-label" %>
#       <%= f.password_field :password_confirmation, class: "form-control", required: true %>
#     </div>

#     <%= f.submit "Sign Up", class: "btn btn-primary" %>
#   <% end %>
# </div>

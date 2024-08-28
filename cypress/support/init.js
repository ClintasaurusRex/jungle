beforeEach(() => {
  cy.exec(
    'rails runner \'User.where(email: "test@example.com").destroy_all; User.create!(email: "test@example.com", password: "password123", password_confirmation: "password123", first_name: "Test", last_name: "User")\''
  );
});

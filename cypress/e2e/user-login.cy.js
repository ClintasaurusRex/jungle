describe("User Login", () => {
  beforeEach(() => {
    cy.visit("/login");
  });

  it("displays the login form elements", () => {
    cy.get('input[type="email"]').should("exist");
    cy.get('input[type="password"]').should("exist");
    cy.get('input[name="commit"]').should("exist");
  });

  it("logs user in", () => {
    cy.get('input[type="email"]').type("test@example.com");
    cy.get('input[type="password"]').type("password123");
    cy.get('input[name="commit"]').click();
  });

  it("logs user out", () => {
    cy.get('input[type="email"]').type("test@example.com");
    cy.get('input[type="password"]').type("password123");
    cy.get('input[name="commit"]').click();
    cy.get('input[value="Log Out"]').should("exist").click();
  });

  it("displays the sign up form elements", () => {
    cy.get('input[value="Sign Up"]').should("exist").click();
    cy.get('input[id="user_first_name"]').should("exist");
    cy.get('input[id="user_last_name"]').should("exist");
    cy.get('input[id="user_email"]').should("exist");
    cy.get('input[id="user_password"]').should("exist");
    cy.get('input[id="user_password_confirmation"]').should("exist");
  });

  it("signs up user", () => {
    cy.get('input[value="Sign Up"]').click();
    cy.get('input[id="user_first_name"]').type("Elon");
    cy.get('input[id="user_last_name"]').type("Musk");
    cy.get('input[id="user_email"]').type("space-man@tesla.com");
    cy.get('input[id="user_password"]').type("password123");
    cy.get('input[id="user_password_confirmation"]').type("password123");
    cy.get('input[value="Sign In"]').click();
  });
});

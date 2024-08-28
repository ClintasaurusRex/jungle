describe("Home Page", () => {
  it("successfully loads", () => {
    cy.visit("/");
  });
  it("There is 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });

  it("clicks the login-signup button", () => {
    cy.visit("/");
    cy.get(".btn.btn-info.login-signup-btn").first().should("be.visible");
  });
});

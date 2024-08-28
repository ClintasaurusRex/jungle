describe("Add to Cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is 2 products on the page", () => {
    // cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });

  it("clicks the login-signup button", () => {
    // cy.visit("/");
    cy.get(".btn.btn-info.login-signup-btn").first().should("be.visible");
  });

  it("should include add to cart button", () => {
    // cy.visit("/");
    cy.get(".products").find(".btn").first().should("be.visible");
  });

  it("Adds a product to the cart and increases the cart count by one", () => {
    // cy.visit("/");
    cy.get(".products article")
      .first()
      .within(() => {
        cy.contains("Add").click();
      });
    cy.get("nav").contains("My Cart (1)").should("exist");
  });
});

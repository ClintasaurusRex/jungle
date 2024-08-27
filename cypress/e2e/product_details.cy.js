describe("Home Page", () => {
  it("successfully loads", () => {
    cy.visit("/");
  });

  it("There is 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });

  it("Navigates to product detail page when clicking a product", () => {
    cy.visit("/");
    cy.get(".products article").first().click();
    cy.url().should("include", "/products/");
    cy.get(".product-detail").should("exist");
    cy.get(".btn").should("exist");
    cy.get(".main-img").should("exist");
    cy.get(".price").should("exist");
    cy.get(".quantity").should("exist");
    cy.get("h1").should("exist");
  });
});

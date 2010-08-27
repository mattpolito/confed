Feature: Presentation Home page
  In order to find the most current presentation additions to the site
  As a site viewer
  I want to see presentations available listed to me

  Scenario: Top 10 newest entries on homepage
    Given there are 15 presentations
    When I am on the homepage
    Then I should see 10 presentation listings

  Scenario: Presentation listing
    Given there is 1 presentation
    When I am on the homepage
    Then I should see 1 presentation listing
    And  it should display title as a link
    And  it should display description
    And  it should display presenter's name
    And  it should display date it took place


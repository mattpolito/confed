Feature: Presentation Home page
  In order to find the most current presentation additions to the site
  As a site viewer
  I want to see presentations available listed to me

  Scenario: Top 10 newest entries on homepage
    Given there are 15 presentations
    When I am on the homepage
    Then I should see 10 presentation listings

  Scenario: Presentation listing
    Given there is a presentation with the following:
      | Title       | How I built this app  |
      | Description | Description           |
    When I am on the homepage
    Then I should see 1 presentation listing
    And  I should see "How I built this app" within "a"
    And  I should see "Description"
    And  I should see "Jeffery Lebowski" within "a"
    And  I should see "My Awesome Conference" 
    And  it should display date it took place


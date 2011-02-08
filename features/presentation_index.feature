Feature: Presentation Home page
  In order to find the most current presentation additions to the site
  As a site viewer
  I want to see presentations available listed to me

  Scenario: Newest released entries on homepage
    Given there are 15 presentations
    And   there are 5 unreleased presentations
    When I am on the homepage
    Then I should see 10 presentation listings
    And  I should see 2 pagination links

  Scenario: Newest entries on homepage with pagination
    Given there are 25 presentations
    When I am on the homepage
    Then I should see 10 presentation listings
    And  I should see 3 pagination links

  Scenario: Presentation listing
    Given there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Released    | true                 |
    When I am on the homepage
    Then I should see 1 presentation listing
    And  I should see a link "How I built this app" within "article h2"
    And  I should see "Description"
    And  I should see a link "Jeffrey Lebowski" within "article"
    And  I should see a link "My Awesome Conference" within "article"


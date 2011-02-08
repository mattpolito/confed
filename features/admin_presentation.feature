Feature: Admin Presentation show
  In order to get all details about presentation
  As an administrator
  I want to see all a page with all related presentation information 

  Scenario: Presentation list view
    Given I logged in as an "admin" user
    And   there are 2 presentations
    When  I am on the admin presentations page
    Then  I should see 2 presentation listings

  Scenario: Presentation list view listing 
    Given I logged in as an "admin" user
    And   there is a presentation with the following:
      | Title       | How I built this app  |
      | Description | Description           |
    When  I am on the admin presentations page
    Then  I should see 1 presentation listing
    And   I should see "How I built this app"
    And   I should see "Jeffrey Lebowski"
    And   I should see "My Awesome Conference"


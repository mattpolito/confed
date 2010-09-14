Feature: Presentation Administration
  In order to get presentations onto the site
  As an administrator
  I want to add and update presentations

  Scenario: Presentation create
    Given I logged in as an admin user
    And   a speaker with the following:
      | Name  | Adam         |
      | Email | adam@foo.com |
    And   I am on the new admin presentation page
    When  I fill in the following:
      | Title       | Presentation Title |
      | Description | Description        |
    And  I select "Adam" from "Speaker"
    And  I press "Create"
    Then I should see "Presentation created!" 

  Scenario: Presentation list view
    Given I logged in as an admin user
    And   there are 5 presentations
    When  I am on the admin presentations page
    Then  I should see 5 presentation listings

  Scenario: Presentation list view listing 
    Given I logged in as an admin user
    And   there is a presentation with the following:
      | Title         | How I built this app  |
      | Description   | Description           |
      | Event Name    | My Awesome Conference |
    When  I am on the admin presentations page
    Then  I should see 1 presentation listing
    And   I should see "How I built this app"
    And   I should see "Jeffery Lebowski"
    And   I should see "My Awesome Conference"

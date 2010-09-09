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

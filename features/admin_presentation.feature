Feature: Admin Presentation show
  In order to get all details about presentation
  As an administrator
  I want to see all a page with all related presentation information 

  Scenario: Presentation create
    Given I logged in as an "admin" user
    And   a speaker with the following:
      | Name  | Adam         |
      | Email | adam@foo.com |
    And   there is an event with the following:
      | Name  | WindyCityRails 2010 |
    And   I am on the new admin presentation page
    When  I fill in the following:
      | Title       | Presentation Title |
      | Description | Description        |
    And  I select "Adam" from "presentation_speaker_id_0"
    And  I select "WindyCityRails 2010" from "Event"
    And  I press "Create Presentation"
    Then I should see "Presentation created!" 

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
    And   I should see "Jeffery Lebowski"
    And   I should see "My Awesome Conference"

  Scenario: Presentation edit
    Given I logged in as an "admin" user
    And   there is a presentation with the following:
      | Title       | How I built this app  |
      | Description | Description           |
    When I am on the admin edit presentation page
    And  I fill in "An updated title" for "Title"
    And  I press "Update Presentation"
    Then I should be on the admin presentations page
    And  I should see "Presentation updated!"

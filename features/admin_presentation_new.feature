Feature: Admin Presentation new
  In order to create a new presentation
  As an administrator
  I want to have a page where I can enter details to create a new presentation 

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
    Then I should be on the new admin presentation page
    Then "WindyCityRails 2010" should be selected for "presentation_event_id"


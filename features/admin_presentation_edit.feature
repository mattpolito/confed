Feature: Admin Presentation edit
  In order to make changes to a presentation
  As an administrator
  I want to see all a page where I can modify related presentation information 

  Scenario: Previous values are populated
    Given I logged in as an "admin" user
    And   there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Tag List    | ruby, cucumber       |
      | Released    | true                 |
    When  I am on the admin edit presentation page
    Then  "My Awesome Conference" should be selected for "presentation_event_id"
    Then  "Jeffery Lebowski" should be selected for "presentation_speaker_id_0"
    Then  the "Title" field should contain "How I built this app"
    Then  the "Description" field should contain "Description"
    Then  the "Tags" field should contain "cucumber, ruby"
    Then  the "Released" checkbox should be checked

  Scenario: Unreleased video should show as unreleased
    Given I logged in as an "admin" user
    And   there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Tag List    | ruby, cucumber       |
      | Released    | false                |
    When  I am on the admin edit presentation page
    Then  the "Released" checkbox should not be checked

  Scenario: Presentation edit
    Given I logged in as an "admin" user
    And   there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
    When I am on the admin edit presentation page
    And  I fill in "An updated title" for "Title"
    And  I press "Update Presentation"
    Then I should be on the admin presentations page
    And  I should see "Presentation updated!"

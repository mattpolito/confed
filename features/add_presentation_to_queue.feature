Feature: Add presentation to queue

  Scenario: Add new presentation when logged in
    Given I am a new, authenticated user
    And  there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Released    | true                 |
    And   has video content
    When  I am on the presentation page
    And I follow "Watch Later"
    Then I should have 1 presentation in my queue
    And I should see "Video Saved"

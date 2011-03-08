Feature: Add presentation to queue

  Scenario: Add new presentation when logged in
    Given I am a new, authenticated user
    And  there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Released    | true                 |
    And has video content
    When  I am on the presentation page
    And I press "Watch Later"
    Then I should have 1 saved presentation
    And I should see "Presentation Saved"
    And I should not see the "Watch Later" button
    And I should see the "Watched" button

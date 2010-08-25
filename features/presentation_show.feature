Feature: Presentation show with video
  In order to learn about a particular subject
  As a site viewer
  I want to see presentation/presenter information
  And I want to see a presentation video embedded onto a page

  Scenario: Viewing presentation page with video
    Given there is a presentation with video content
    When  I am on the presentation page
    Then  I should see the presentation title
    And   I should see the presentation description
    And   I should see the presentation video
    And   I should see the presenter's name
    And   I should see the event name


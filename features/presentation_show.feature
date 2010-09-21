Feature: Presentation show with video In order to learn about a particular subject
  As a site viewer
  I want to see presentation/presenter information
  And I want to see a presentation video embedded onto a page

  Scenario: Viewing presentation page with video
    Given there is a presentation with the following:
      | Title       | How I built this app  |
      | Description | Description           |
      | Event Name  | My Awesome Conference |
    And   has video content
    When  I am on the presentation page
    Then  I should see "How I built this app" within ".presentation .title"
    And   I should see "Description" within ".presentation .description"
    And   I should see the presentation video
    And   I should see "Jeffery Lebowski" within ".presentation .speaker .name"
    And   I should see "My Awesome Conference" within ".presentation .event .name"

Feature: Presentation show 
  In order to learn about a particular subject
  As a site viewer
  I want to see presentation/presenter information
  And I want to see a presentation video embedded onto a page

  Scenario: Viewing page with video
    Given there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
    And   has video content
    When  I am on the presentation page
    Then  I should see "How I built this app"
    And   I should see "Description"
    And   I should see the presentation video
    And   I should see a link "Jeffery Lebowski"
    And   I should see "My Awesome Conference"

  Scenario: Viewing page with slideshow 
    Given there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
    And   has slideshow content
    When  I am on the presentation page
    Then  I should see "How I built this app"
    And   I should see "Description"
    # And   I should see the presentation slideshow 
    And   I should see a link "Jeffery Lebowski"
    And   I should see "My Awesome Conference"

  Scenario: Viewing page with video and slideshow 
    Given there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
    And   has video content
    And   has slideshow content
    When  I am on the presentation page
    Then  I should see "How I built this app"
    And   I should see "Description"
    And   I should see the presentation video
    # And   I should see the presentation slideshow 
    And   I should see a link "Jeffery Lebowski"
    And   I should see "My Awesome Conference"

Feature: Presentation show 
  In order to learn about a particular subject
  As a site viewer
  I want to see presentation/presenter information
  And I want to see a presentation video embedded onto a page

  Scenario: Viewing page with video
    Given I am hitting an external service for url shortening
    And  there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Released    | true                 |
    And   has video content
    When  I am on the presentation page
    Then  I should see "How I built this app"
    And   I should see "Description"
    And   I should see the presentation video
    And   I should see a link "Jeffrey Lebowski"
    And   I should see "My Awesome Conference"

  Scenario: Viewing page with slideshow 
    Given I am hitting an external service for url shortening
    And   there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Released    | true                 |
    And   has slideshow content
    When  I am on the presentation page
    Then  I should see "How I built this app"
    And   I should see "Description"
    # And   I should see the presentation slideshow 
    And   I should see a link "Jeffrey Lebowski"
    And   I should see "My Awesome Conference"

  Scenario: Viewing page with video and slideshow 
    Given I am hitting an external service for url shortening
    And   there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Released    | true                 |
    And   has video content
    And   has slideshow content
    When  I am on the presentation page
    Then  I should see "How I built this app"
    And   I should see "Description"
    And   I should see the presentation video
    # And   I should see the presentation slideshow 
    And   I should see a link "Jeffrey Lebowski"
    And   I should see "My Awesome Conference"

  Scenario: Has page title
    Given I am hitting an external service for url shortening
    And   there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Released    | true                 |
    When  I am on the presentation page
    Then  I should see page title as "How I built this app - My Awesome Conference - Confed"

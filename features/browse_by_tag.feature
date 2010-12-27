Feature: Browse by tag
  In order to find more information about a specific subject
  As a site user
  I want to click on tags to be shown relevant information

  Scenario: Browse to tag page
    Given there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
      | Released    | true                 |
    And   the presentation has the tag: "follow me"
    When  I am on the presentations page
    And   I follow "follow me"
    Then  I should see "Tagged: follow me"
    And   I should see a link "How I built this app" within "article"

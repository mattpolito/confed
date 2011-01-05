Feature: Event list 
  In order to find events available on the site 
  As a site viewer
  I want to see events in a browsable list

  Scenario: Event list
    Given there are 15 events
    When  I am on the events index page
    Then  I should see 10 event listings
    And   I should see 2 pagination links

  Scenario: Event listing
    Given there is an event with the following:
      | Name | My Awesome Conference |
    When  I am on the events index page
    Then  I should see 1 event listing
    And   I should see a link "My Awesome Conference" within "article h2"

  Scenario: Event name link
    Given there is an event with the following:
      | Name | My Awesome Conference |
    When  I am on the events index page
    When  I follow "My Awesome Conference"
    Then  I should be on the event page

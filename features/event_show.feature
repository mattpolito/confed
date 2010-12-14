Feature: Event Profile
  In order to learn more about an event
  As a site visitor
  I want to view a profile page for the event

  @wip
  Scenario: Viewing an event with all information provided
    Given an event with the following:
      | Name            | WindyCityRails            |
      | Website         | http://windycityrails.org |
      | Started On      | 2010-09-11                |
      | Ended On        | 2010-09-11                |
      | Speaker Rate Id | 111-windycityrails        |
    When I am on the event show page
    Then I should see "WindyCityRails"
    Then I should see "09.11.2010 - 09.11.2010"
    Then I should see an external link "WindyCityRails" to "http://windycityrails.org"

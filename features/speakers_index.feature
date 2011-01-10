Feature: Speakers Index
  In order to find more info about speakers
  As a site visiter
  I want to see speakers listed out

  Scenario: Show top 10 recently active speakers
    Given there are 15 speakers
    When  I am on the speakers index page
    Then  I should see 10 speaker listings

  Scenario: Speaker listing
    Given a speaker with the following:
      | Name            | Adam                      |
      | Title           | Software Craftsman        |
      | Location        | Chicago, IL               |
      | Bio             | Too much to put in a test |
      | Company Name    | Foo Inc.                  |
      | Company URL     | http://foo.com            |
      | Email           | adam@foo.com              |
      | Twitter         | adamfoo                   |
      | Website         | http://blog.com           |
      | Speaker Rate Id | 111-adam                  |
    When  I am on the speakers index page
    Then  I should see 1 speaker listing
    And   I should see a link "Adam"
    And   I should see "Software Craftsman"
    And   I should see "Foo Inc."
    And   I should see "Too much to put in a test"
    And   I should not see "adam@foo.com"
    And   I should not see "adamfoo"


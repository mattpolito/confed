Feature: Speakers Index
  In order to find more info about speakers
  As a site visiter
  I want to see speakers listed out

  Scenario: Show top 10 recently active speakers
    Given there are 15 speakers
    When  I am on the speakers index page
    Then  I should see 10 speaker listings

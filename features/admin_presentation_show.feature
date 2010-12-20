Feature: Admin Presentation show
  In order to get all details about presentation
  As an administrator
  I want to see all a page with all related presentation information 

  Scenario: Has presentation edit link
    Given I logged in as an "admin" user
    And   there is a presentation with the following:
      | Title       | How I built this app |
      | Description | Description          |
    When  I am on the admin presentation page
    And   I follow "Edit"
    Then  I should be on the admin edit presentation page 

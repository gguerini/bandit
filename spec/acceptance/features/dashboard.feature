Feature: User Dashboard
  In order to manage my account
  I want to be able to visit my dashboard

  Background:
    Given I am signed in

  Scenario: Viewing my dashboard
    When I visit the dashboard
    Then I should see my details
    And I should be able to edit my profile and to add a new race report

  Scenario: Visiting the dashboard when I'm not signed in
    Given I am not signed in
    When I visit the dashboard
    Then I should be prompt to sign in

Feature: Race Report Management
  In order to manage my race reports
  I want to be able to visit my dashboard

  Background:
    Given I am signed in
    And I am on my dashboard

  Scenario: Creating a Race Report
    Given I want to create a new race report
    When I fill in the race report form
    Then I should have a new race report
    And I should see the race report

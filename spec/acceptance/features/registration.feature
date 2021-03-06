Feature: Registration for a new account
  In order to use Bandit
  I want to be able to sign up for a new account

  Scenario: Registering a new account
    Given I want to sign up for a new account
    When I fill in my registration info
    Then I should have a new account
    And I should be redirected to my dashboard

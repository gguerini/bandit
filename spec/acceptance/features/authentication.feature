Feature: Signing in on Bandit
  In order to do anything whatsoever
  I want to be able to sign in and sign out

  Scenario: Signing in
    When I sign in
    Then I should be signed in
    And I should be redirected to my dashboard

  Scenario: Signing out
    When I sign in
    And I sign out
    Then I should not be signed in

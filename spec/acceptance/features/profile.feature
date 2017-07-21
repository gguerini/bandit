Feature: User Profile
  In order to see a user's race reports
  I want to be able to visit their profile

  Background:
    Given I am signed in

  Scenario: Viewing my own profile
    When I visit my profile
    Then I should see my profile
    And I should be able to edit my profile

  Scenario: Viewing someone else's profile
    When I visit Jesse Owens profile
    Then I should see their profile
    And I should not be able to edit their profile

  Scenario: Viewing someone's profile when I'm not signed in
    Given I am not signed in
    When I visit Jesse Owens profile
    Then I should see their profile
    And I should not be able to edit their profile
    And I should be able to sign in or sign up

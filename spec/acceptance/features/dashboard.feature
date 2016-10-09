Feature: User Dashboard
  In order to see a user's profile and race reports
  As a user
  I want to be able to visit their dashboard

  Scenario: Viewing my own dashboard
    When I visit my dashboard
    Then I should see and be able to edit my profile

  Scenario: Viewing someone else's profile
    Given I am signed in
    When I visit Jesse Owens dashboard
    Then I should see their profile but not be able to edit their profile

  Scenario: Viewing someone's profile when I'm not signed in
    Given I am not signed in
    When I visit Jesse Owens dashboard
    Then I should see their profile but not be able to edit their profile

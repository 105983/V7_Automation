Feature: Login Functionality
  As a Full manager user
  I want to log in to my account
  So I can use My system

  @ssmoke
  Scenario: Successful Login

    Given I open the app
    When I enter username and password
    Then I should see Project List in the page
    When I navigate to the project form dashboard
    And I click on the Project Disclimber


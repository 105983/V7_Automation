Feature: Create user
  As a Full manager user
  I want to log in to my account
  So I can use My system

  @ssmoke
  Scenario: Invite an existing user

    When I click on the created project
    And I click on link "Open Project"
    When I click on the "Users" tab
    And I select "Add User"  option from "New" menu
    And I select Managers from team
    And I select Security Role
    And I Enter Email Address
    And I uncheck Required Activation
    And I send the invitation
    Then I close the last tab

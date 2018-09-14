Feature: To activate a user
  As a Full manager
  I want to activate a user in this project


 @ssmoke

  Scenario: Activate User

    When I click on User status and click on inactive users
    And I select the user name "Dulces"
    And I select "Activate" option from "Actions" menu
    Then I should see the "Dulces" in the grid

 #  @reg

  Scenario: Activate User

    And I select "Activate" option from "Actions" menu
    Then I should see the "Dulces" in the grid
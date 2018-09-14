Feature: To deactivate a user
  As a Full manager
  I want to deactivate a user from this project


   @ssmoke @reg

  Scenario: Deactivate user

    When I click on the project navigation Users tab
    When I select the user name "Dulces"
    And I select "Deactivate" option from "Actions" menu
    Then I should not see the "Dulces" in the grid
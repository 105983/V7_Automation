Feature: To Create a Security role
  As a Full manager
  I want to create a role for a user


  @ssmoke @reg

  Scenario: Create a Security role

    And I click documents link
    And I click on "Security Roles" button
    And I select "Security Role" option from "New" menu
    And I enter Security role name "view reviewer" in the text box
    And I enter Security role Description "Alpha" in the text box
    And I select security role type
    Then I should see created role in the security roles
    Then I close the Security role

Feature: To Delete a Fileroom
  As a Full manager
  I want to delete the unwanted fileroom
  So that i can organize

# @smoke @reg

  Scenario: Delete  fileroom

    And I should come out of the fileroom
    When I select the fileroom name "CreateFileroom"
    And I select "Deactivate Fileroom" option from "Action" menu
    And I click on "Yes" button
    When I select the fileroom name "CreateFileroom"
    And I select "Delete Fileroom" option from "Action" menu
    And I click on "Yes" button
    Then I should not see the "CreateFileroom" in the grid


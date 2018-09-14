Feature: To Delete a watermark template
  As a Full manager
  I want to Delete a watermark template


  @ssmoke @reg

  Scenario: Delete watermark


    When I click on "WM_1"
    And I select "Delete" option from "Actions" menu
    Then I should not see the "WM_1" in the grid

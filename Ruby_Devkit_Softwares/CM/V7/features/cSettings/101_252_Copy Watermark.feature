Feature: To copy a watermark template

  As a Full manager i want to copy
  a watermark template

   @ssmoke @reg

  Scenario: Copy watermark

     When I click on "WM_1"
    And I select "Copy" option from "Actions" menu
    And i click Template Title and enter "WM_Copy"
    And click on save button
    Then I should see the created "WM_Copy" in the grid
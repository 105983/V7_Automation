Feature: To create a watermark template
  As a Full manager
  I want to create a watermark template



  @ssmoke @reg
  Scenario: Create Watermark

    When I click on the project navigation Settings tab
    And I select "Watermark" option from "New" menu
    And i click on Template Title and enter "WM_1"
    And click on save button
    And click on save button
    Then I should see the created "WM_1" in the grid

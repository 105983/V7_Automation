Feature: To Create a placeholder from New menu
  As a Full manager
  I want to create placeholder to the fileroom
  So that I can make use of them later

  @ssmoke
  Scenario: Create Placeholder

    And I select "Placeholder" option from "New" menu
    And I enter folder name "placeholder" in the text box
    Then I should see the created "placeholder" in the grid

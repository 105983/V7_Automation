Feature: To Create a folder from New menu
  As a Full manager
  I want to create folder to the fileroom
  So that I can make use of them later

  @ssmoke
  Scenario: Create Folder

    When I double click and get into the "CreateFileroom" fileroom
    And I select "Folder" option from "New" menu
    And I enter folder name "Folder1" in the text box
    Then I should see the created "Folder1" in the grid


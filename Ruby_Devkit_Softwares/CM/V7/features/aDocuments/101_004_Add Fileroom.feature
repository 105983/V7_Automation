Feature: To Add a fileroom
  As a Full manager
  I want to add fileroom
  So that I can upload files in it later

  @ssmoke
  Scenario: Addfileroom

    When I click on the project navigation Documents tab
    And I select "Fileroom" option from "New" menu
    And I enter "CreateFileroom" fileroom name in the text box
    Then I should see the created "CreateFileroom" in the grid

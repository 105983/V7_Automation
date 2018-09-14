Feature: To Create a Date UDF field and associate to  from New menu
  As a Full manager
  I want to create Date UDF to the fileroom
  So that I can make use of them later

  @ssmoke

  Scenario: Create Date UDF

    And I select "Manage User Defined Fields" option from "Actions" menu
    And I select "Date" option from "Add Field" menu
    And I enter Date UDF name "Date_udf" in the text box
    And I select "Manage User Defined Fields" option from "Actions" menu
    Then I should see the created "Date_udf" in the grid
    Then i should close the wizard

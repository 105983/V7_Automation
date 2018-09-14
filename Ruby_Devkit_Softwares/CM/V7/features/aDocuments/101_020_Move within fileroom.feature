Feature: To Move a doc
  As a Full manager
  I want to move a document in the samefileroom

  @ssmoke

  Scenario: Move to same fileroom


    When I select the "Mdocwfr" document
    And I select "Move To" option from "Actions" menu
    And I click on move to wizard
    And i click on folder
    And click on save button
    And select the security level
    And Click on publish option
    When I select the "Folder1" folder
    Then I should see the moved doc "Mdocwfr" in the grid
   # And I should come out of the fileroom


  @reg

  Scenario: Move to same fileroom

    When I double click and get into the "Dfolder" folder
    When I select the "Mdocwfr" document
    And I select "Move To" option from "Actions" menu
    And I click on move to wizard
    And i click on  folder
    And click on save button
    And select the security level
    And Click on publish option
    And I should come out of the fileroom
    When I select the "Mfolder" folder
    Then I should see the moved doc "Mdocwfr" in the grid
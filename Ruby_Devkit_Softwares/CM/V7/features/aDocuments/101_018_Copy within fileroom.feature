Feature: To copy a doc
  As a Full manager
  I want to copy a document in the samefileroom


  @ssmoke
  Scenario: copy to same fileroom

    When I select the "Cdoc" document
    And I select "Copy To" option from "Actions" menu
    And I click on Copy to wizard
    And i click on folder
    And click on save button
    And select the security level
    And Click on publish option

    When I select the "Folder1" folder
    Then I should see the copied doc "Cdoc" in the grid
   # And I should come out of the fileroom

  # @reg
  Scenario: copy to same fileroom

    When I double click and get into the "Dfolder" folder
    When I select the "Cdoc" document
    And I select "Copy To" option from "Actions" menu
    And I click on Copy to wizard
    And i click on folder
    And click on save button
    And select the security level
    And Click on publish option
    And I should come out of the fileroom
    When I select the "Cfolder" folder
    Then I should see the copied doc "Cdoc" in the grid
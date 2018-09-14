Feature: To copy a doc
  As a Full manager
  I want to copy a document in the differentfileroom


 @ssmoke

  Scenario: Copy to different Fileroom

   When I double click and get into the "CreateFileroom" fileroom
    When I select the "Cdoc" document
    And I select "Copy To" option from "Actions" menu
    And I click on  Copy to wizard
    And click on save button
    And select the security level
    And Click on publish option
    And I should come out of the fileroom
    When  I click into the other fileroom
    Then I should see the moved doc "Cdoc" in the grid




   # @reg

  Scenario: Copy to different Fileroom

    When I double click and get into the "Default" fileroom
    When I double click and get into the "Dfolder" folder
    When I select the "Cdoc" document
    And I select "Copy To" option from "Actions" menu
    And I click on  Copy to wizard
    And click on save button
    And select the security level
    And Click on publish option
    And I should come out of the fileroom
    And I should come out of the fileroom
    When I double click and get into the "Permanent" fileroom
    Then I should see the copied doc "Cdoc" in the grid








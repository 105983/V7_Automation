Feature: To Move a doc
  As a Full manager
  I want to move a document in the differentfileroom


  @ssmoke

  Scenario: Move different fileroom

    When I select the "MdocAfr" document
    And I select "Move To" option from "Actions" menu
    And I click on move to  wizard
    And click on save button
    And select the security level
    And Click on publish option
    And I should come out of the fileroom
    When  I click into the other fileroom
    Then I should see the moved doc "MdocAfr" in the grid



  @reg

  Scenario: Move different fileroom

    When I double click and get into the "Dfolder" folder
    When I select the "MdocAfr" document
    And I select "Move To" option from "Actions" menu
    And I click on move to  wizard
    And click on save button
    And select the security level
    And Click on publish option
    And I should come out of the fileroom
    And I should come out of the fileroom
    When I double click and get into the "Permanent" fileroom
    Then I should see the moved doc "MdocAfr" in the grid





Feature: Feature: To move a doc to different fileroom and verify audit
  As a Full manager
  I want to move a document in the differentfileroom and verify the audit


  @ssmoke

  Scenario: Move different fileroom property history

    When I select the "MdocAfr" document
    And I select "Change History" option from "History" menu
    Then I should  see move in the Change type column
    Then I click on "Close" button
    And I should come out of the fileroom

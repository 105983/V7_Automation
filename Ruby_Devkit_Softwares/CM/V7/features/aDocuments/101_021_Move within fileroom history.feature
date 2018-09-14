Feature: To Move a doc to same fileroom and verify audit
  As a Full manager
  I want to move a document in the samefileroom and verify the audit

  @ssmoke

  Scenario: Move to same fileroom property history

    When I select the "Mdocwfr" document
    And I select "Change History" option from "History" menu
    Then I should  see move in the Change type column
    Then I click on "Close" button
    And I should come out of the fileroom






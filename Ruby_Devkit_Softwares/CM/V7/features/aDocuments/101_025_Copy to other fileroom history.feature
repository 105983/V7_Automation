Feature: To copy a doc to same fileroom and verify audit
  As a Full manager
  I want to copy a document in the samefileroom and verify history is captured


   @ssmoke

  Scenario: copy to different fileroom property history


    When I select the "Cdoc" document
    And I select "Change History" option from "History" menu
    Then I should see copy in the Change type column
    Then I click on "Close" button

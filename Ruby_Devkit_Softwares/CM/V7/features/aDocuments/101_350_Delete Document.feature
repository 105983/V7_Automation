Feature: To Delete a Doc
  As a Full manager
  I want to delete a document from the grid


 @ssmoke

  Scenario: Delete_doc


    And I select "Delete" option from "Actions" menu
    And I click on "Yes" button
    Then I should not see the "Cdoc" in the grid
    And I should come out of the fileroom
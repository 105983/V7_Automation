Feature: To Publish a Doc
  As a Full manager
  I want to publish a document from the grid


  @ssmoke @reg

  Scenario: Editsecurity_publish

    Then I click on "Test" word document
    And I select "Edit Security" option from "Actions" menu
    And I select "print" option from Edit wizard and publish
    And I click on "Publish" button
    Then verify Print is set to the document
    Then I click on "Cancel" button

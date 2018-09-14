Feature: To Assign a task to a Doc
  As a Full manager
  I want to assign a task to a doc


  @ssmoke @reg

  Scenario: Editsecurity_Assign

    When I click on "Zebronics" word document
    And I select "Edit Security" option from "Actions" menu
    And I select print option from Edit wizard and Assign
    And I click documents link
    And I click on "Security Tasks" button
    When I select the assigned task
    And I select "Publish" option from "Actions" menu
    And I click on "Content" button
    Then verify Print is set to the document
    Then I click on "Cancel" button
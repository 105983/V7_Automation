Feature: To View a Document in viewer
  As a Full manager
  I want to view the document


  @ssmoke

  Scenario: Viewer_Doc

    Then I click on "Zebronics" document
    Then I should see the  "Zebronics" in the viewer
    Then i close the viewer
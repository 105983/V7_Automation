Feature: verify audit of a active user
  As a Full manager
  I want to activate a user in this project and verify his audit


   @ssmoke

  Scenario: User history Active users

    And I select the user name "Dulces"
    And I click on Dulces user change "History"
    Then I should see the status in New value Column
    Then I click on "Close" button

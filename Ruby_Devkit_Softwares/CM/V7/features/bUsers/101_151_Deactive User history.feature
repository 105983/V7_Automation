Feature: verify audit of a deactivate user


  @ssmoke @reg

  Scenario: User history Deactive users

    When I click on User status and click on inactive users
    And I select the user name "Dulces"
    And I click on Dulces user change "History"
    Then I should see  the status in New value Column
    Then I click on "Close" button
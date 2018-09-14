Feature: To perform a basic search
  As a Full manager
  I want to do a basic search

  @ssmoke @reg
  Scenario: Basic search

    And I should come out of the fileroom
    When I enter "Zebronics" in the search field
    And I click on Global search Button
    Then I click on "Zebronics" search document
    Then I should see the  "Zebronics" in the viewer
    Then i close the viewer
    Then i close the Search results
Feature: To perform a Advanced search
  As a Full manager
  I want to do a Advanced search
   @ssmoke @reg
  Scenario: Advanced search




    Then I click on "Advanced" button
    Then I Select the field
    Then I select an operator
    Then I Enter a value "Zebronics"
    And I click on "Search" button
    Then I should see "Zebronics" in search results
    Then i close the Search results


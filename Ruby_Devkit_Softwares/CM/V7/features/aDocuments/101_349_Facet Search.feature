Feature: To perform a Facet search
  As a Full manager
  I want to do a Facet search
  # @smoke @reg
  Scenario: Facet search


    When I click on "currency" in Facet search
    Then i click on USD currency
    Then I click on "Submit" button
    Then I should see the  "USD" in the search results
    Then i close the Search results


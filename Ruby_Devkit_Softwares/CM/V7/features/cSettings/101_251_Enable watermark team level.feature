Feature: Enable Watermark Template for team level

  As a Full manager i want to enable Watermark template for User team

 #  @smoke @reg
  Scenario: Enable Watermark

    When I click on the project navigation Users tab
    When i click "All Teams"
    And i click on "Managers"
    And I select "Edit Team" option from "Actions" menu
    And i click on watermark template
    And i click on Watermark DDM
    And click on save button
    And I click on the project navigation Documents tab
    Then I click on "Zebronics" document
    Then i close the viewer

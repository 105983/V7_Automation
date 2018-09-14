Feature: Last Functionality
  As a Full manager user
  I want to run my last execution

   @clean
  Scenario: last execution

   Given I open the app
   When I enter username and password
   When I navigate to the project

    When I click on the project navigation Documents tab
    When I double click and get into the "Permanent" fileroom
    When I select the "MdocAfr" document
    And I select "Move To" option from "Actions" menu
    And I click on  move to  wizard
    And i select on folder
    And click on save button
    And select the secuity level
    And Click on publish option
    And i select all documents
    And I select "Delete" option from "Actions" menu
    And I click on "Yes" button
    And I should come out of the fileroom
    When I double click and get into the "Default" fileroom
    When I select the "Mfolder" folder
    When I select the "Mdocwfr" document
    And I select "Move To" option from "Actions" menu
    And I click on  move to  wizard
    And i  select on folder
    And click on save button
    And select the secuity level
    And Click on publish option
    And I select "Manage User Defined Fields" option from "Actions" menu
    And   I select "Date_udf"
    And I click on "Yes" button
    And I click on "Done" button
    And I should come out of the fileroom
    When I click on "Assign" word document
    And I select "Edit Security" option from "Actions" menu
    And I select Hidden  option from Edit wizard and publish
    And I click on "Publish" button
    Then I click on "Publish" word document
    And I select "Edit Security" option from "Actions" menu
    And I select Hidden  option from Edit wizard and publish
    And I click on "Publish" button
    When I click on the project navigation Users tab
    When i click "All Teams"
    And i click on "Managers"
    And I select "Edit Team" option from "Actions" menu
    And i click on watermark template
    And i click on None DDM
    And click on save button
   When I click on the project navigation Settings tab
#    When i click on "WM_Copy"
#    And I select "Delete" option from "Actions" menu
#    When i click on "WM_2"
#    And I select "Delete" option from "Actions" menu





#    When I select the Document file
#    And I select "Delete" option from "Actions" menu
#    And I click on "Yes" button
#    And I select "Edit Fileroom Details" option from "Actions" menu
#    And  I select the UDF column
#    And click on save button
#    And I click on "Yes" button



    And I finish the Execution



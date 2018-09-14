Feature: To create a email alert
  As a Full manager
  I want to create an email alert


   # @ssmoke @reg

  Scenario: Email alert

      When I click on the project navigation Documents tab
      When I double click and get into the "CreateFileroom" fileroom
      When I select the "Zebronics" document
      And I select "Email Alert" option from "Actions" menu
      And I try to select the Send On
      And I enter alert name "Email +" in the text box
      And I select the receipents
      And I click on "Save" button
      And I wait for alert to display in the grid
      When I click on the project navigation Alerts tab
      When I click on the project navigation Documents tab
      When I click on the project navigation Alerts tab
      Then I should see the created alert




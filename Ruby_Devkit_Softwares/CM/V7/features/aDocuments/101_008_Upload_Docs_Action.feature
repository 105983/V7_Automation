Feature: Documents - Upload -Action menu
  As a Full manager
  I want to upload documents to the fileroom
  So that I can make use of the uploaded files later

  @ssmoke
  Scenario: Upload documents to the fileroom zip file


    And I select "Upload File" option from "Actions" menu
    And I browser and select the  files to be uploaded
    Then I should see the created "Desert" in the grid


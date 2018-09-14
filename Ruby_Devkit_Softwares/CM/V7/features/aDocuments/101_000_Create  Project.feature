Feature: To Create a project as a Merrill User


  @ssmoke

  Scenario: Project creation

    Given Load the tracker login page
    When I enter  username and password
    Then I should land on the Dashboard page
    And I click on link "Projects"
    And I click on new button
    And I click on addproject and check the demo project checkbox
    And I enter "DS_demo_smoketest_" in "title"
    And I enter "1114522585458" in "saNumber"
    And I select Asset Sale from datasiteType
    And I click on adjacency as "Contract Management"
    And I enter "Test Company" in "managingCompanyPeer"
    And I click on Sales Team
    And I  click  on "Edit DataSite Sales Reps"
    And I  click  on "Add Rep"
    And I enter "TestSales" in name
    And I  click  on "Edit DataSite Sales Reps"
    And I click on Project Management Team
    And I click on pm location
    And I select STP from PM TEAM
    And I click on Location and Revenue
    Then I should see the created project






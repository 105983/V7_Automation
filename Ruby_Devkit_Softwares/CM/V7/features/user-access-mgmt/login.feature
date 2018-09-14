
Feature: Login Functionality
	As a Full manager user
	I want to log in to my account
	So I can use My system
	@login @p5
	Scenario: Successful Login
		Given I open the app
		When I enter username and password
		When I navigate to the project
		And I log out


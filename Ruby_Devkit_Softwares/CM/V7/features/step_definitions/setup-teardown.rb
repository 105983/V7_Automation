## This file will have the common steps ##
require 'yaml'

##changes related to jenkins run ##
config = YAML.load_file("#{$filePath}object-repository.yaml")


Then(/^TearDown: Delete Fileroom with name of "([^"]*)"$/) do |deletefr|

  steps %{
    When I select the fileroom name "#{deletefr}"
    And I select "Deactivate Fileroom" option from "Action" menu
    And I click on "Yes" button
    When I select the fileroom name "#{deletefr}"
    And I select "Delete Fileroom" option from "Action" menu
    And I click on "Yes" button
    Then I should not see the "#{deletefr}" in the grid
     }

end

Then(/^SetUp: create Fileroom with name of "([^"]*)"$/) do |createfr|
  steps %{
    When I click on the project navigation aDocuments tab
    And I select "Fileroom" option from "New" menu
    And I enter "#{createfr}" fileroom name in the text box
    Then I should see the created "#{createfr}" in the grid
    }

  sleep 5

end

Then(/^SetUp: I ll select "([^"]*)" option from "([^"]*)" menu$/) do |opt,action|
  click_on action
  click_on opt
  sleep 5
end

And(/^SetUp: I select "([^"]*)"$/) do |dudf|
  within(find(:xpath,"//div[@id='manageUdfWindow']"))do
    #within(find(:xpath, config['commonSpan']['manageUDF']))do
    @vv = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
    #@dduf=find(:xpath,"//div[contains(@class,'x-grid3-cell-inner x-grid3-col-label x-unselectable')]").text
    #puts @dduf
    #puts "raja output #{@@dduf}"
    i=1
    @vv.each do |el|
    @dduf=find(:xpath,"//div[contains(@class,'x-grid3-row')][#{i}]//table//td[2]/div").text
   # puts 'i:' + i.to_s
    #puts 'DDUF: ' + @dduf
      if(dudf==@dduf)
        within el do
          sleep 3
          el.find(:xpath,"//div[contains(@class,'x-grid3-row')][#{i}]//table//div[@class='x-grid3-cell-inner x-grid3-col-4 x-unselectable']").click
          sleep 3
          break
        end
      else
      i = i+1
      end
      end
  end
    # rowid.each do |ss|
    #   userDefinedfield=ss.find(:xpath,"//div[contains(@class,'x-grid3-cell-inner')]").text
    #   if userDefinedfield==dudf
    #     find(:xpath,"//div[contains(@class,'x-grid3-cell-inner x-grid3-col-4 x-unselectable')]").click
    #   elsif
    #   puts "do nothing"
    #
    #   end
    # end

  click_button "Yes"
  click_button "Done"

end

And(/^I refresh the screen$/) do
sleep 10
  page.driver.browser.navigate.refresh
  sleep 3
  # find(:xpath,"//span[contains(text(),('aDocuments'))]").click
  find(:xpath,"(//span[@class='x-tab-strip-text '])[2]").click
end




Then(/^SetUp:create Placeholder for the filerooom "([^"]*)"$/) do |fr|
  steps %{
    When I double click and get into the "#{fr}" fileroom
    And I select "Placeholder" option from "New" menu
    And I enter folder name "placeholder" in the text box
    Then I should see the created "placeholder" in the grid
}
end


Then(/^Setup: Upload document to the "([^"]*)" fileroom$/) do |arg|
steps %{
 When I double click and get into the "#{arg}" fileroom
    And I select "Upload Document" option from "New" menu
    And I browser and select the files to be uploaded
    Then I should see the created "Zebronics" in the grid
      }
end
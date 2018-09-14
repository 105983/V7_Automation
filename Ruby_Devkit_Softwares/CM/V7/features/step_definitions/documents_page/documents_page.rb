## This file will have the common steps ##
require 'yaml'
config = YAML.load_file("#{$filePath}object-repository.yaml")
$cfg = config

$tempPath = 'C:\\Users\\Administrator\\Downloads\\'

############################################################################

#==============step_definations for login ===================================#

# When(/^I enter username and password$/) do
#   sleep(2)
#   if ENV['env'] == 'Test'
#     step "I enter username 108643@merrillcorp.com and password Fullman@1619"
#   elsif ENV['env'] == 'Stage'
#     step "I enter username 108643@merrillcorp.com and password Fullman@1619"
#   end
# end




When(/^I navigate to the project$/) do
  if ENV['env'] == 'test'
    find(:xpath, config['ENV']['testENV']).click
    sleep 2.5
    # step "I need to wait progress div"
  elsif ENV['env'] == 'prod'
    # visit "https://datasite-prod.merrillcorp.com/ds/r/ds/project/69c6f7ac-9036-4ff4-a76c-3cc48429fde2"
    find(:xpath, config['ENV']['prodENV']).click
    sleep 2.5
    # step "I need to wait progress div"
  elsif ENV['env'] == 'stage'
    find(:xpath, config['ENV']['stageENV']).click
    sleep 2.5
    # step "I need to wait progress div"
  end
end

############################################## Add_FR###################################


And(/^I enter "([^"]*)" fileroom name in the text box$/) do |frtext|
  fill_in('fileroomTitle', :with => frtext)
  find(:id, "fileRoomSaveButton").click
  sleep 1
end

Then(/^I should see the created "([^"]*)" in the grid$/) do |frname|
  sleep 1
  expect(page).to have_content frname
  sleep 5
end


##############################################Delete_FR_#################################


When(/^I select the fileroom name "([^"]*)"$/) do |frname|
  sleep 5
  find(:xpath, config['commonSpan']['selFr'].sub("TEXT", frname)).click
  sleep 2
end


And(/^I select "([^"]*)" option from "([^"]*)" menu$/) do |opt, action|
  click_on action
  sleep 1
  click_on opt
  sleep 1
end


Then(/^I click on "([^"]*)" button$/) do |button|
  sleep 3
  click_on button


end

Then(/^I should not see the "([^"]*)" in the grid$/) do |fr|
  sleep 2.5
  expect(page).not_to have_content fr
  sleep 2.5
end


##############################################Upload_docs_#################################

When(/^I double click and get into the "([^"]*)" fileroom$/) do |ducli|
  sleep 4
  find(:xpath, config['commonSpan']['selFr'].sub("TEXT", ducli)).double_click
  sleep 1
end


And(/^I browser and select the files to be uploaded$/) do

  within(:xpath, "//div[@id='uploadFileWindow']") do
    Capybara.ignore_hidden_elements = false
    z = page.find(:xpath, "//*[@type='file']", :visible => false)['name']
    attach_file(z, File.absolute_path('C:\Ruby_Devkit_Softwares\CM\V7\features\support\upload_files\Zebronics.docx'))
    sleep 1
    page.first(:xpath, "//button[text()='Publish']", :visible => true).click
  end
  Capybara.ignore_hidden_elements = true
#  page.click_on("ext-gen375")
  sleep 2
end

Then(/^I should come out of the fileroom$/) do

  # find(:xpath,"//div[contains(text(),'Double click row to go back']").double_click
  find(:xpath, "//div[contains (text(),'To Parent')]").double_click
  sleep 10
end

########################Create_folder.rb######################################

And(/^I enter folder name "([^"]*)" in the text box$/) do |fname|
  fill_in('placeholderItemsTitle', :with => fname)
  click_button 'Publish'
  sleep 1
end

########################Date_udf.rb######################################

And(/^I enter Date UDF name "([^"]*)" in the text box$/) do |dudfname|
  # find(:xpath, config['commonSpan']['dateudf']).set("#{dudfname}")
  fill_in('label', :with => dudfname)

  # check("allAssociated")
  sleep(1)
  page.click_on("Save")

  sleep 1
  page.click_on("Done")
  sleep 1

  #fill_in(find(:css,['name=label']['type=text']),:with=>dudfname)

  #find(:xpath, config['documents_obj']['searchBox']).set("")
end

And(/^I select the UDF column$/) do
  sleep 10
  # within_window windows.last do

  within(:xpath, "(//div[@class='x-grid3-scroller'])[4]") do
    page.find(:xpath, "//td[@class='x-grid3-col x-grid3-cell x-grid3-td-checker x-grid3-cell-first ']").click


    # page.find(:xpath,"((//div[text()='Date_udf'])[3]/../../td/div/div)[1]").click
  end
end


And(/^I select "([^"]*)"$/) do |arg|
  page.find(:xpath, config['commonSpan']['xmark']).click
end

########################Editrow.rb######################################
When(/^I select the Placeholder file$/) do
  find(:xpath, config['commonSpan']['chkall']).click
end

Then(/^I click on "([^"]*)" word document$/) do |szeb|
  sleep 1
  page.find(:xpath, config['commonSpan']['selFr'].sub("TEXT", szeb)).click
end

And(/^I enter "([^"]*)" in the Title field$/) do |desc|
  find(:xpath, config['commonSpan']['Tedit']).set(desc)
  sleep 1
end

########################Basic search.rb######################################
When(/^I enter "([^"]*)" in the search field$/) do |src|
  # visit 'https://datasite-prod.merrillcorp.com/ds/r/ds/project/69c6f7ac-9036-4ff4-a76c-3cc48429fde2'
  sleep 5
  # fill_in('x-form-text x-form-field x-form-empty-field',:with=>src)
  # fill_in(find(:xpath,"//div[@class='x-box-inner search-trigger-main']//input"),:with=>src)
  # fill_in 'ext-comp-1296',:with=>src
  find(:xpath, "(//input[@type='text'])[2]").set(src)
  # fill_in 'ext-comp-1319',:with=>src
end

Then(/^I should see the  "([^"]*)" in the viewer$/) do |zeb|
  expect(page).to have_content zeb
end

And(/^I click on Global search Button$/) do
  find(:xpath, config['commonSpan']['searchbox']).click
  sleep 4
end


Then(/^I click on "([^"]*)" search document$/) do |szeb|
  sleep 15
  page.find(:xpath, config['commonSpan']['selFr'].sub("TEXT", szeb)).double_click
  sleep 5
end

Then(/^I click on "([^"]*)" document$/) do |szeb|

  page.find(:xpath, config['commonSpan']['selFr'].sub("TEXT", szeb)).double_click
  sleep 1

end


Then(/^i close the viewer$/) do
  within_window windows.last do
    current_window.close
  end
  # browser.window(:title => /Datasite: 1 - Zebronics -Google Chrome/).use do
  #   #Whatever you want to do with the popup

  sleep 1

end

Then(/^i close the Search results$/) do
  sleep 5
  page.find(:xpath, config['commonSpan']['SeaRes']).click
end

###############################Delete_Doc.rb##################################

When(/^I select the Document file$/) do
  find(:xpath, config['commonSpan']['chkall']).click
end

###############################Copy_samefileroom.rb##################################

When(/^I select the "([^"]*)" document$/) do |szeb|
  sleep 2
  page.find(:xpath, config['commonSpan']['selFr'].sub("TEXT", szeb)).click
  sleep 1
end

And(/^I click on Copy to wizard$/) do
  sleep 1.5
  within(:xpath, "//div[@id='moveToWindow']") do
    sleep 1.5
    within(:xpath, "(//div[@id='moveToFolderTree'])") do
      sleep 1.5
      #find(:xpath,config['commonSpan']['Copyfol']).click
      #  within(:xpath, "(//span[@class='x-tree-node-indent'])[8]")do


      within(:xpath, "(//li[@class='x-tree-node'])[5]") do
        sleep 2
        find(:xpath, "(//span[contains(text(),'CreateFileroom')])[2]").double_click

      end

    end


  end

end


And(/^I click on the "([^"]*)" folder$/) do |fol|
  #with_in(:xpath,"moveToWindow").click
  find(:xpath, config['commonSpan']['Sfolder'].sub("TEXT", fol)).click
  sleep(1.5)
end

And(/^click on save button$/) do
  page.click_on('Save')
  sleep 1
end

And(/^select the security level$/) do
  find(:xpath, config['commonSpan']['Asecurity']).click
end

And(/^Click on publish option$/) do
  page.click_on('Publish')
  sleep 6
end

And(/^i click on folder$/) do
  sleep 2
  find(:xpath, config['commonSpan']['Sfolder']).click
end

And(/^i click on fileroom$/) do
  find(:xpath, config['commonSpan']['Sfileroom']).click
end

When(/^I select the "([^"]*)" folder$/) do |fol|
  sleep 10
  page.find(:xpath, config['commonSpan']['selFr'].sub("TEXT", fol)).double_click
  sleep 5
end

Then(/^I should see the copied doc "([^"]*)" in the grid$/) do |zdoc|
  sleep 3
  expect(page).to have_content zdoc
end

And(/^i click on tree folder$/) do
  sleep 1.5
  find(:xpath, config['commonSpan']['Tfolder']).double_click
end

###############################Move_samefileroom.rb##################################

And(/^I click on move to wizard$/) do
  sleep 1.5
  within(:xpath, "//div[@id='moveToWindow']") do
    sleep 1.5
    within(:xpath, "(//div[@id='moveToFolderTree'])") do
      sleep 1.5
      #find(:xpath,config['commonSpan']['Copyfol']).click
      #  within(:xpath, "(//span[@class='x-tree-node-indent'])[8]")do


      within(:xpath, "(//li[@class='x-tree-node'])[5]") do
        sleep 2
        find(:xpath, "(//span[contains(text(),'CreateFileroom')])[2]").double_click

      end

    end


  end
end

Then(/^I should see the moved doc "([^"]*)" in the grid$/) do |mdoc|
  sleep 2.5
  expect(page).to have_content mdoc
end

###############################Copy_differentfileroom.rb##################################

And(/^I select on Copy to wizard$/) do
  find(:xpath, config['commonSpan']['Sfileroom']).click
end

# When(/^I select the "([^"]*)" fileroom$/) do |file|
#   page.find(:xpath,config['commonSpan']['selFr'].sub("TEXT",file)).double_click
# end

###############################Move_differentfileroom.rb##################################

And(/^I select on move to wizard$/) do
  find(:xpath, config['commonSpan']['froom1']).click
end

###############################Editsecurity_publish.rb##################################


And(/^I select "([^"]*)" option from Edit wizard and publish$/) do |opt|
  within(:xpath, "(//div[@class='ds-sub-panel-body'])[1]") do
    page.find(:xpath, " (//*[@title='Apply print level security'][1]//..//..)[1]").click
    # find(:xpath,"(//div[@class='ds-sub-panel-body'])[1]//span[text()='#{opt}']").click
    sleep 1
  end
end


Then(/^verify Print is set to the document$/) do
  steps %{
  And I select "Edit Security" option from "Actions" menu
        }

  expect(page).to have_xpath("//li[@class=' securityCheckBoxExistingTrue securityCheckBox rDatasitePrint_checkbox']")
end

###############################Editsecurity_assign.rb#################################

And(/^I select print option from Edit wizard and Assign$/) do
  page.find(:xpath, " (//*[@title='Apply print level security'][1]//..//..)[1]").click
  page.find(:xpath, "(//button[@class=' x-btn-text' and text() ='Publish']/../../..)/td[3]").click
  page.find(:xpath, "//span[@class='x-menu-item-text' and text() = 'Assign']").click
  sleep 1
end


When(/^I select the assigned task$/) do
  find(:xpath, config['commonSpan']['chkall']).click
  sleep 1.5
end


And(/^I click documents link$/) do
  find(:id, "manageDocumentsQuickView").click
  sleep 1
end

###############################Deactivateuser.rb##################################

When(/^I select the user name "([^"]*)"$/) do |eid|
  find(:xpath, config['commonSpan']['selFr'].sub("TEXT", eid)).click
end


And(/^I click on User status and click on inactive users$/) do
  within(:xpath, "(//div[@class=' x-panel x-box-item'])[5]") do
    find(:xpath, "//a[contains(text(),'Inactive')]").click
  end
end

###############################Activateuser.rb##################################

Then(/^I should see the "([^"]*)" in the grid$/) do |uname|
  sleep 2.5
  find(:xpath, "//a[contains(text(),'Active')]").click
  sleep 2.5
  expect(page).to have_content uname
end

###############################Create a Security role.rb##################################

And(/^I enter Security role name "([^"]*)" in the text box$/) do |stext|
  dateTime = Time.new
  $labelTemp = stext + "#{dateTime.strftime("%d-%b-%Y %H:%M")}"
  fill_in('roleCreateName', :with => $labelTemp)
end

And(/^I enter Security role Description "([^"]*)" in the text box$/) do |dtext|
  fill_in('roleDescription', :with => dtext)
  # click_button 'Save'
end

And(/^I select security role type$/) do
  within(:id, "addRoleForm") do
    find(:id, "roleType").click
    find(:xpath, "//div[@class='x-combo-list-item x-combo-selected']").click
    click_button 'Save'

  end
end

Then(/^I close the Security role$/) do
  page.find(:xpath, config['commonSpan']['Secrol']).click
end

Then(/^I should see created role in the security roles$/) do
  sleep 4
  expect(page).to have_content "#{$labelTemp}"
end

###############################CreateWatermark.rb##################################

When(/^i click on New menu$/) do
  # find(:xpath,"(//span[@class='pointer'])[2]").click
  # find(:xpath,"(//table[@class='x-btn x-btn-text-icon'])[2]").click
  # find(:id,"templatesAddButtonGroup").click
  sleep 1
end

Then(/^i click on Watermark$/) do
  find(:xpath, "(//span[@class='x-menu-item-text'])[3]").click
  sleep 1

end

And(/^i click on Template Title and enter "([^"]*)"$/) do |tem|
  fill_in 'newName', :with => tem
  sleep 1

end

###############################DeleteWatermark.rb##################################

When(/^I click on "([^"]*)"$/) do |te|
  sleep 5
  find(:xpath, config['commonSpan']['selFr'].sub('TEXT', te)).click
  sleep 1
end


###############################CopyWatermark.rb##################################

And(/^i click Template Title and enter "([^"]*)"$/) do |ct|
  fill_in 'copyName', :with => ct
end

###############################EnableWatermark.rb##################################


When(/^i click "([^"]*)"$/) do |ew|
  find(:xpath, config['commonSpan']['comSP'].sub('TEXT', ew)).click

end


And(/^i click on watermark template$/) do
  find(:xpath, "//input[@name='watermark_header_templateText']").click
end

And(/^i click on Watermark DDM$/) do
  find(:xpath, "//div[contains(text(),('Watermark'))]").click
  sleep 1
end

And(/^i click on None DDM$/) do
  find(:xpath, "//div[contains(text(),('None'))]").click
end

###############################Copy_property_history.rb##################################

Then(/^I should see copy in the Change type column$/) do
  sleep 15
  expect(page.find(:xpath, "(//div[@class ='x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[1]").text).to eq("Copy")
#  expect(page).to have_xpath("(//div[@class = 'x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[1]")
end

###############################Move_property_history.rb##################################

Then(/^I should see move in the Change type column$/) do
  sleep 15
  expect(page.find(:xpath, "(//div[@class='x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[2]").text).to eq("Move")
end

###############################Copy_differentproperty_history_.rb##################################


Then(/^I should  see copy in the Change type column$/) do
  sleep 15
  expect(page.find(:xpath, "(//div[@class = 'x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[2]").text).to eq("Copy")
end

###############################Move_differentproperty_history_.rb##################################

Then(/^I should  see move in the Change type column$/) do
  sleep 15
  expect(page.find(:xpath, "(//div[@class='x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[1]").text).to eq("Move")
end

########################Userhistory_Active user.rb####################

Then(/^I should see the status in New value Column$/) do
  sleep 15
  expect(page.find(:xpath, "(//div[@class='x-grid3-cell-inner x-grid3-col-3 x-unselectable'])[3]").text).to eq("Active")

end

And(/^I click Active link$/) do
  find(:xpath, "//a[contains(text(),'Active')]").click
end


And(/^I click on Dulces user change "([^"]*)"$/) do |uchange|
  click_on uchange
  sleep 2.5
end

########################Userhistory_Deactive user.rb####################

Then(/^I should see  the status in New value Column$/) do
  sleep 15
  expect(page.find(:xpath, "(//div[@class='x-grid3-cell-inner x-grid3-col-3 x-unselectable'])[1]").text).to eq("Inactive")
end

########################Z_LastScenario.rb####################
And(/^I finish the Execution$/) do
  puts 'JenkinsExit'
end


When(/^I double click and get into the "([^"]*)" folder$/) do |dfol|
  sleep 2
  find(:xpath, config['commonSpan']['selfol'].sub("TEXT", dfol)).double_click
  sleep 1
end


And(/^i click on  folder$/) do
  sleep 1
  find(:xpath, config['commonSpan']['Ssfolder']).click
end

And(/^I click on move to  wizard$/) do
  sleep 1.5
  within(:xpath, "//div[@id='moveToWindow']") do
    sleep 1.5
    within(:xpath, "(//div[@id='moveToFolderTree'])") do
      sleep 1.5
      #find(:xpath,config['commonSpan']['Copyfol']).click
      #  within(:xpath, "(//span[@class='x-tree-node-indent'])[8]")do


      # within(:xpath, "(//li[@class='x-tree-node'])[5]") do
      #   sleep 1.5
        find(:xpath, "(//span[contains(text(),'#{$Temp1}')])[6]").click

      end

    end


  end


And(/^I click on  Copy to wizard$/) do
  sleep 1.5
  within(:xpath, "//div[@id='moveToWindow']") do
    sleep 1.5
    within(:xpath, "(//div[@id='moveToFolderTree'])") do
      sleep 1.5
      #find(:xpath,config['commonSpan']['Copyfol']).click
      #  within(:xpath, "(//span[@class='x-tree-node-indent'])[8]")do


      # within(:xpath, "(//li[@class='x-tree-node'])[5]") do
      #   sleep 1.5
      find(:xpath, "(//span[contains(text(),'#{$Temp1}')])[6]").click

    end

  end


end

And(/^I click on  move to  wizard$/) do
  sleep 2.5
  within(:xpath, "//div[@id='moveToWindow']") do
    sleep 2.5
    within(:xpath, "(//div[@id='moveToFolderTree'])") do
      sleep 2.5
      #find(:xpath,config['commonSpan']['Copyfol']).click
      #  within(:xpath, "(//span[@class='x-tree-node-indent'])[8]")do


      within(:xpath, "(//li[@class='x-tree-node'])[6]") do
        sleep 2.5
        find(:xpath, "(//span[contains(text(),' Default')])[2]").double_click

      end

    end


  end
end

And(/^i select on folder$/) do
  sleep 2.5
  find(:xpath, config['commonSpan']['Dfol']).click
end

And(/^i select all documents$/) do
  find(:xpath, config['commonSpan']['chkall']).click
end


And(/^I select Hidden  option from Edit wizard and publish$/) do
  within(:xpath, "(//div[@class='ds-sub-panel-body'])[1]") do
    page.find(:xpath, " (//*[@title='Apply hidden level security'][1]//..//..)[1]").click
    # find(:xpath,"(//div[@class='ds-sub-panel-body'])[1]//span[text()='#{opt}']").click
    sleep 2
  end
end


And(/^i  select on folder$/) do
  sleep 2.5
  find(:xpath, config['commonSpan']['Ddfol']).click
end

Then(/^i should close the wizard$/) do
  sleep 1
  within(:xpath, "//div[@id='manageUdfWindow']") do
    sleep 1
    within(:xpath, "//div[@class='x-window-header x-unselectable x-window-draggable']") do
      sleep 1
      find(:xpath, config['commonSpan']['wclose']).click
    end
  end
end


Then(/^i click  on "([^"]*)"$/) do |arg|
  sleep 7.5
  find(:xpath, "(//div[@class='x-grid3-cell-inner x-grid3-col-st_templates_subject_col x-unselectable'])[7]").click
end

Then(/^I Select the field$/) do
  find(:xpath, "(//div[@class='x-form-field-wrap x-form-field-trigger-wrap x-box-item'])[3]").click
  sleep 1

  find(:xpath, "(//div[@class = 'x-combo-list-inner'])").find(:xpath, "(//div[@class = 'x-combo-list-item'][2])").select_option
  sleep 1

end

Then(/^I select an operator$/) do

  find(:xpath, "(//input[@class=' x-form-text x-form-field x-form-empty-field x-trigger-noedit'])[1]").click
  find(:xpath, "(//div[@class ='x-combo-list-inner'])").find(:xpath, "(//div[@class = 'x-combo-list-item'][1])").select_option
  sleep 1

end


Then(/^I Enter a value "([^"]*)"$/) do |src|
  find(:xpath, "(//input[@class='x-form-text x-form-field x-form-empty-field x-box-item'])[1]").click.set(src)
  sleep 1
  # find(:xpath, "(//input[@class='x-form-text x-form-field x-form-empty-field x-box-item'])[1]").set(src)
end

Then(/^I should see "([^"]*)" in search results$/) do |src|
  expect(page).to have_content src
end

When(/^I click on "([^"]*)" in Facet search$/) do |curr|
  # find(:xpath,"//div[@id='contentManager']").click
  within(:xpath, "(//div[@class='x-box-inner'])[6]") do
    sleep 2
    find(:xpath, "//span[@class='facet-count']").click
    sleep 5
  end
end

Then(/^i click on USD currency$/) do


  sleep 5
  find(:xpath, "(//input[@class=' x-form-checkbox x-form-field'])[2]").click
  sleep 5
end

Then(/^I should see the  "([^"]*)" in the search results$/) do |us|
  sleep 2.5
  expect(page).to have_content us
end

################## create project ############################




When(/^I enter "([^"]*)" and "([^"]*)"$/) do |uname, pwd|
  fill_in('loginUsername', :with => uname)
  fill_in('loginPassword', :with => pwd)
  click_button('Login')
  sleep 2

end

Then(/^I should land on the Dashboard page$/) do
  page.has_title? "Dashboard"
end

And(/^I click on link "([^"]*)"$/) do |linkname|
  sleep 1
  click_link linkname
  sleep 5

end

And(/^I click on new button$/) do
  sleep 1
  within(:xpath, "//div[@id='primary-tabs-pnl-cont']") do
    find(:xpath, "//span[text()='New']").click
    sleep 1
    find(:xpath, "//span[text()='Add Project']").click
    sleep 2
  end
end

And(/^I click on addproject and check the demo project checkbox$/) do
  within(:xpath, "//div[@id='projectCreateWindow']") do
    find(:xpath, "//input[@name='demoProject']").click
  end

end


And(/^I enter "([^"]*)" in "([^"]*)"$/) do |objname, id|
  case
    when id == "fileroomTitle"
      fill_in('fileroomTitle', :with => objname)
    when id == "placeholderItemsTitle"
      fill_in('placeholderItemsTitle', :with => objname)
    when id == "title"
      dateTime = Time.new
      $Temp1 = objname + "#{dateTime.strftime("%d-%b-%Y %H%M")}"
      #fill_in('roleCreateName',:with=>$labelTemp)
      fill_in("title", :with => $Temp1)

    when id == 'saNumber'
      dynamicname = Time.new
      $labelTime = objname + "#{dynamicname.strftime("%H%M%S")}"
      fill_in(id, :with => $labelTime)
    when id == "managingCompanyPeer"
      find(:xpath, "//input[@name='managingCompanyPeer']/../input[2]").set(objname)
      sleep 15
      find(:xpath, "//input[@name='managingCompanyPeer']/../input[2]").click
      sleep 2


  end
end

And(/^I select Asset Sale from datasiteType$/) do

  find(:xpath, "//label[text()='* DataSite Type:']/..//img").click
  sleep 1

  find(:xpath, "(//div[@class = 'x-combo-list-inner'])").find(:xpath, "(//div[@class = 'x-combo-list-item'][2])").select_option
  # find(:xpath,"(//div[contains(text(),'Audit')])[2]").click
  sleep 1

end

And(/^I click on adjacency as "([^"]*)"$/) do |adj|
  within(:xpath, "(//div[@class = 'x-form-item '])[5]") do
    find(:xpath, "//input[@value='Contract Management']").click

  end
end

And(/^I click on Sales Team$/) do
  within(:xpath, "(//div[@class = 'x-form-item '])[5]") do
    sleep 2
    find(:xpath, "(//span[contains(text(),'Sales Team')])[2]").click
    sleep 2
  end
end

And(/^I  click  on "([^"]*)"$/) do |button|
  click_button button
  sleep 3
end

And(/^I enter "([^"]*)" in name$/) do |name|
  sleep 3
  within(:xpath, "(//div[@class = 'x-grid3-scroller'])[4]") do
    sleep 5
    find(:xpath, "//div[@class ='x-grid3-cell-inner x-grid3-col-uuid x-unselectable']").click
    sleep 5
    find(:xpath, "(//div[@class = 'x-combo-list-inner'])").find(:xpath, "(//div[@class = 'x-combo-list-item'][4])").select_option
    sleep 5
    find(:xpath, "(//div[@class = 'x-grid3-cell-inner x-grid3-col-primary x-unselectable'])").click
    sleep 5
  end
end

And(/^I click on Project Management Team$/) do
  within(:xpath, "(//div[@class = 'x-plain-body x-plain-body-noheader'])[4]") do
    find(:xpath, "(//span[contains(text(),'Project Management Team')])[2]").click
    sleep 3
    within(:xpath, "(//div[@class='x-form-item '])[14]") do
      find(:xpath, "//input[@name='managingPmUsersPeer']/following-sibling::input[1]").set("108")
      sleep 6
      find(:xpath, "//div[contains(text(), '108628')]").select_option
      sleep 5
    end
  end
end

And(/^I click on pm location$/) do
  within(:xpath, "//div[@id='pmLocationRadioGroup']") do
    choose('US')
    sleep 2
  end
end

And(/^I select STP from PM TEAM$/) do
  within(:xpath, "(//div[@class='x-form-element'])[22]") do
    find(:xpath, "//input[@name='pmTeamShift']/following-sibling::input[1]").set("STP")
    sleep 5
  end
end

And(/^I click on Location and Revenue$/) do
  within(:xpath, "(//div[@class = 'x-plain-body x-plain-body-noheader'])[4]") do
    find(:xpath, "(//span[contains(text(),'Location and Revenue')])[2]").click
    sleep 3
    within(:xpath, "(//div[@class='x-panel-body'])[7]") do
      find(:xpath, "//input[@name='revenueSite']/../img").click
      #find(:xpath, "//input[@name='revenueSite']/following-sibling::input[1]").set("ATA (Atlanta)")
      sleep 3
      find(:xpath, "(//div[@class = 'x-combo-list-inner'])").find(:xpath, "(//div[@class = 'x-combo-list-item'][2])").select_option
      # find(:xpath,"(//div[contains(text(),'BOS (Boston)')])[2]").click
      sleep 3
      find(:xpath, "//input[@name='timeZone']/../img").click
      sleep 2
      find(:xpath, "//div[text()='Africa/Abidjan']").click
      sleep 3
      find(:xpath, "//input[@name='countryOfIssuer']/../img").click
      sleep 2
      find(:xpath, "(//div[@class = 'x-combo-list-inner'])").find(:xpath, "(//div[@class = 'x-combo-list-item'][1])").select_option
      # find(:xpath,"//div[contains(text(),'Algeria')]").click
      sleep 5
      find(:xpath, "//button[contains(text(),'Submit')]").click
      sleep 15
    end
  end
end


Then(/^I should see the created project$/) do
  within(:xpath, "(//div[@id='primary-tabs-pnl-cont'])") do
    expect(page).to have_content "#{$Temp1}"
  end
end

###########################Email Alert #################

And(/^I try to select the Send On$/) do
  within(:xpath, "//div[@class='x-window-mr']") do
    find(:xpath, "//input[@name='scheduledSendDate']").click
    sleep 3
    within(:xpath, "//div[@class='x-menu x-menu-floating x-layer x-date-menu x-menu-plain x-menu-nosep']") do
      click_button 'Today'
    end
  end
end


And(/^I enter alert name "([^"]*)" in the text box$/) do |stext|
  dateTime = Time.new
  $email = stext + "#{dateTime.strftime("%d-%b-%Y %H:%M")}"
  fill_in('title', :with => $email)
  sleep 3
end

And(/^I select the receipents$/) do
  sleep 3
  within(:xpath, "//div[@class='x-window-mr']") do
  #within(:xpath, "(//div[@class='x-grid3-viewport'])[5]") do
 # find(:xpath,"//td[@class='x-grid3-hd x-grid3-cell x-grid3-td-checker x-grid3-cell-first']").click
 # within(:xpath, "(//div[@class='x-grid3-scroller'])[5]") do
    # find(:xpath, config['commonSpan']['chkall']).click
   # find(:xpath,"(//div[@class='x-grid3-hd-checker'])[2]").click
     find(:xpath, "(//div[contains (text(),'Dulce Dulces')])").click
  end
  end




Then(/^I should see the created alert$/) do
  sleep 5
  expect(page).to have_content "#{$email}"

end

And(/^I wait for alert to display in the grid$/) do
  sleep 80
end

And(/^I click on  Project Management Team$/) do
  within(:xpath, "(//div[@class = 'x-plain-body x-plain-body-noheader'])[4]") do
    find(:xpath, "(//span[contains(text(),'Project Management Team')])[2]").click
    sleep 3
    within(:xpath, "(//div[@class='x-form-item '])[14]") do
      find(:xpath, "//input[@name='managingPmUsersPeer']/following-sibling::input[1]").set("108")
      sleep 6
      find(:xpath, "//div[contains(text(), '108628')]").select_option
      sleep 5
    end
  end
end

####################################create user ##############################

Given(/^I visit Gmail$/) do
  visit 'https://accounts.google.com/ServiceLogin?service=mail&continue=https://mail.google.com/mail/#identifier'
end

When(/^I enter the user Credentials$/) do
  if page.has_xpath? "//span[text()='Next']"
    fill_in 'identifierId', :with => 'autouserv7@gmail.com'
    find(:xpath, "//*[@id='identifierNext']").click
  end
  if page.has_xpath? "//span[text()='Next']"
    fill_in 'password', :with => 'AutoPass'
  end
end

And(/^I click on submit button$/) do
  find(:xpath, "//*[@id='passwordNext']").click
end

And(/^I click on the project invitation$/) do
  within 'div.Cp' do
    invitationname = "Invitation to DataSite Project #{projectName}"
    page.find(:xpath, "//b[contains(text(),'#{invitationname}')]").click
  end
end

And(/^I click on the project invitation link$/) do
  within 'div.gs' do
    env = ENV['env']
    case
      when env == 'stage'
        find(:xpath, "//a[contains(text(),'stage-maw')]").click
      when env == 'stage2'
        find(:xpath, "//a[contains(text(),'stage2-maw')]").click
      when env == 'testb'
        find(:xpath, "//a[contains(text(),'testb')]").click
      when env == 'prod'
        find(:xpath, "//a[contains(text(),'1')]").click
      when env == 'dev'
        find(:xpath, "//a[contains(text(),'dev-maw')]").click
    end
  end
end

And(/^I enter the username and submit$/) do
  within_window windows.last do
    fill_in 'email', :with => 'dsv6.automation@gmail.com'
    click_on 'Save'
  end
end

Then(/^I should get registration confirmation message$/) do
  within_window windows.last do
    expect(page).to have_content 'Thank you for registering with Merrill DataSite'
    Local_helper.closebrowser
  end
end

Then(/^I logged out from the gmail$/) do
  sleep 1
  page.find(:xpath, "//*[@id='gb']/div[1]/div[1]/div[2]/div[5]/div[1]/a").click
  sleep 1
  page.find(:xpath, "//a[contains(text(),'Sign out')]").click
end

#################### Invite Existing user #########

When(/^I click on the created project$/) do
  sleep 5

  find(:xpath, "//div[text()='#{$Temp1}']").click
  # find(:xpath,"//div[text()='DS_demo_smoketest_16-Aug-2018 1921']").click
  sleep 5

end


Then(/^I should see Project List in the page$/) do
  find(:xpath, "//span[text()='Project List']")
end


And(/^I select "([^"]*)"  option from "([^"]*)" menu$/) do |opt, action|
  within_window windows.last do
    click_on action
    sleep 1
    click_on opt
    sleep 6
  end
end


Then(/^I close the first tab$/) do
  within_window windows.first do
    current_window.close
    sleep 5
  end
end

When(/^I click on the "([^"]*)" tab$/) do |us|
  within_window windows.last do
    page.click_on us
  end
end

And(/^I select Managers from team$/) do
  within_window windows.last do
    find(:id, "newUserTeam").click
    find(:xpath, "//div[@class='x-combo-list-item x-combo-selected']").click
  end
end


And(/^I select Security Role$/) do
  within_window windows.last do
    sleep 2
    find(:id, "newUserRole").click
    find(:xpath, "//div[@class='x-combo-list-item x-combo-selected']").click
  end
end


And(/^I Enter Email Address "kittusdad\+65233@gmail\.com,kittusdad\+652333@gmail\.com"$/) do |email|
  within_window windows.last do
    sleep 2
    fill_in('newUserEmail', :with => email)
    click_button 'Send'
    sleep 5
    # find(:id, "newUserEmail").click.set(email)
  end
end

And(/^I Enter Email Address$/) do
  within_window windows.last do
    sleep 2
    fill_in('newUserEmail', :with => 'kittusdad+6523@gmail.com,kittusdad+65233@gmail.com')

  end
end


Then(/^I close the last tab$/) do
  within_window windows.last do
    current_window.close
    sleep 3

  end
end

When(/^I navigate to the project form dashboard$/) do
  sleep 2
  find(:xpath, "//div[text()='#{$Temp1}']").double_click
   # find(:xpath,"//div[text()='DS_demo_smoketest_16-Aug-2018 1921']").double_click
  sleep 3

end

And(/^I uncheck Required Activation$/) do

  within_window windows.last do
    sleep 2
    # find(:xpath,"//label[@class='x-form-cb-label']").click
    # find(:xpath, "(//input[@class=' x-form-checkbox x-form-field'])").click
    find(:id, "requireManualActivation").click
  end
end

And(/^I send the invitation$/) do
  within_window windows.last do
    click_button 'Send'
  end
end

And(/^I click on the Project Disclimber$/) do
  click_button 'I Accept'
end

And(/^I browser and select the  files to be uploaded$/) do
  within(:xpath, "//div[@id='uploadFileWindow']") do
    Capybara.ignore_hidden_elements = false
    z = page.find(:xpath, "//*[@type='file']", :visible => false)['name']
    attach_file(z, File.absolute_path('C:\Ruby_Devkit_Softwares\CM\V7\features\support\upload_files\Docs.zip'))

    sleep 1
    page.first(:xpath, "//button[text()='Publish']", :visible => true).click
  end
  Capybara.ignore_hidden_elements = true
#  page.click_on("ext-gen375")
  sleep 2
end


When(/^I click into the other fileroom$/) do
  sleep 4
  find(:xpath, "//div[text()='#{$Temp1}']").double_click
  sleep 1
end


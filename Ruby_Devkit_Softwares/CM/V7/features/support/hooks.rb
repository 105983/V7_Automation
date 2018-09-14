$username = ""

After('~@login') do |scenario|
  # step "I log out"
end

Before('@login') do |scenario|
  # step "I open the app"
  # step "I enter username and password"
  # step "I navigate to the project"
end
############################### Add_Fileroom_hook##################################

After('@addfileroom') do |scenario|
  step 'TearDown: Delete Fileroom with name of "CreateFileroom"'
end
#################################################################


############################### Delete_Fileroom_hook##################################


Before('@deletefileroom') do |scenario|
  step 'SetUp: create Fileroom with name of "RemoveFileroom"'
end

############################### Upload_docsnew_hook##################################

Before('@uploaddocsnew') do |scenario|
  step 'SetUp: create Fileroom with name of "UploadDocViaNew"'
end


After('@uploaddocsnew') do |scenario|
  step 'TearDown: Delete Fileroom with name of "UploadDocViaNew"'

end

############################### Upload_document_hook##################################

Before('@uploaddocsaction') do |scenario|

  step 'SetUp: create Fileroom with name of "UploadDocViaActMenu"'

end


After('@uploaddocsaction') do |scenario|

  step 'TearDown: Delete Fileroom with name of "UploadDocViaActMenu"'
end

###############################create_folder_hook##################################

Before('@create_folder') do |scenario|

  step 'SetUp: create Fileroom with name of "create_folder"'

end


After('@create_folder') do |scenario|

  step 'TearDown: Delete Fileroom with name of "create_folder"'
end

###############################create_PH_hook##################################

Before('@create_ph') do |scenario|

  step 'SetUp: create Fileroom with name of "create_placeholder"'

end


After('@create_ph') do |scenario|

  step 'TearDown: Delete Fileroom with name of "create_placeholder"'
end

###############################create_Date_UDF_hook##################################

Before('@create_Date_udf') do |scenario|

  step 'SetUp: create Fileroom with name of "create_DateUDF_FR1"'
  step 'SetUp: create Fileroom with name of "create_DateUDF_FR2"'
  steps %{
  I double click and get into the "create_DateUDF_FR1" fileroom
  I select "Upload File" option from "Actions" menu
  I browser and select the files to be uploaded
  I should see the created "Desert" in the grid
  I should come out of the fileroom
  I double click and get into the "create_DateUDF_FR2" fileroom
  I select "Upload File" option from "Actions" menu
  I browser and select the files to be uploaded
  I should see the created "Desert" in the grid
  I should come out of the fileroom
        }

end


After('@create_Date_udf') do |scenario|
  step 'TearDown: Delete Fileroom with name of "create_DateUDF_FR1"'
  step 'TearDown: Delete Fileroom with name of "create_DateUDF_FR2"'
  step  'I refresh the screen'
  step 'SetUp: I ll select "Manage User Defined Fields" option from "Actions" menu'
  step 'SetUp: I select "Date_udf"'

end

###############################Editrow_hook##################################
Before('@editrow') do |scenario|
step 'SetUp: create Fileroom with name of "Erow"'
step 'SetUp:create Placeholder for the filerooom "Erow"'
end

After('@editrow') do |scenario|
   step 'I should come out of the fileroom'
  step 'TearDown: Delete Fileroom with name of "Erow"'

end



################Dummy#############end


After('@dummy') do |scenario|
  step 'SetUp: I ll select "Manage User Defined Fields" option from "Actions" menu'
  step 'SetUp: I select "Date_udf"'
end

###############################Basicsearch_hook##################################
Before('@Basicsearch') do |scenario|
  step 'SetUp: create Fileroom with name of "Bas_Ser"'
  step 'Setup: Upload document to the "Bas_Ser" fileroom'
  step  'I refresh the screen'
end

 After('@Basicsearch') do |scenario|
   step 'i close the viewer'
   step 'i close the Search results'
   step 'TearDown: Delete Fileroom with name of "Bas_Ser"'
 end

###############################Viewer_hook##################################
Before('@Viewer') do |scenario|
  step 'SetUp: create Fileroom with name of "Doc_View"'
  step 'Setup: Upload document to the "Doc_View" fileroom'
  step  'I refresh the screen'
end

After('@Viewer') do |scenario|
  step 'i close the viewer'
  step 'I should come out of the fileroom'
  step 'TearDown: Delete Fileroom with name of "Doc_View"'
end

###############################Delete_Doc_hook##################################
Before('@DeleteDoc') do |scenario|
  step 'SetUp: create Fileroom with name of "Del_Doc"'
  step 'Setup: Upload document to the "Del_Doc" fileroom'
  step  'I refresh the screen'
  step 'I double click and get into the "Del_Doc" fileroom'
end

After('@DeleteDoc') do |scenario|
   step 'I should come out of the fileroom'
   step 'TearDown: Delete Fileroom with name of "Del_Doc"'
end

###############################Copy_samefileroom_hook##################################
Before('@Copytosameroom') do |scenario|
  step 'SetUp: create Fileroom with name of "Copy_Doc"'
  step 'Setup: Upload document to the "Copy_Doc" fileroom'
  step 'I select "Folder" option from "New" menu'
  step 'I enter folder name "Folder1" in the text box'
  step  'I refresh the screen'
  step 'I double click and get into the "Copy_Doc" fileroom'
end

After('@Copytosameroom') do |scenario|
  # step 'I should come out of the fileroom'
   step 'I should come out of the fileroom'
  step  'I refresh the screen'
  step 'TearDown: Delete Fileroom with name of "Copy_Doc"'
end

###############################Move_samefileroom_hook##################################

Before('@Movetosameroom') do |scenario|
  step 'SetUp: create Fileroom with name of "Move_Doc"'
  step 'Setup: Upload document to the "Move_Doc" fileroom'
  step 'I select "Folder" option from "New" menu'
  step 'I enter folder name "Folder1" in the text box'
  step  'I refresh the screen'
  step 'I double click and get into the "Move_Doc" fileroom'
end

After('@Movetosameroom') do |scenario|
  # step 'I should come out of the fileroom'
  step 'I should come out of the fileroom'
  step  'I refresh the screen'
  step 'TearDown: Delete Fileroom with name of "Move_Doc"'
end

###############################Copy_differentfileroom_hook##################################
Before('@Copytodifferentroom') do |scenario|
  step 'SetUp: create Fileroom with name of "Copy_Doc"'
  step 'SetUp: create Fileroom with name of "C_doc1"'
  step 'Setup: Upload document to the "Copy_Doc" fileroom'
  step  'I refresh the screen'
    step 'I double click and get into the "Copy_Doc" fileroom'

 end

After('@Copytodifferentroom') do |scenario|
  step 'I should come out of the fileroom'
  step 'TearDown: Delete Fileroom with name of "Copy_Doc"'
  step 'TearDown: Delete Fileroom with name of "C_doc1"'
end

###############################Move_differentfileroom_hook##################################
Before('@Movetodifferentroom') do |scenario|
  step 'SetUp: create Fileroom with name of "Move_Doc"'
  step 'SetUp: create Fileroom with name of "M_doc1"'
  step 'Setup: Upload document to the "Move_Doc" fileroom'
  step  'I refresh the screen'
  step 'I double click and get into the "Move_Doc" fileroom'

end

After('@Movetodifferentroom') do |scenario|
  step 'I should come out of the fileroom'
  step 'TearDown: Delete Fileroom with name of "Move_Doc"'
  step 'TearDown: Delete Fileroom with name of "M_doc1"'
end

###############################Editsecurity_publish_hook##################################
Before('@publish') do |scenario|
  # step 'I click on the project navigation Documents tab'
  step 'SetUp: create Fileroom with name of "Publish_Doc"'
  step 'Setup: Upload document to the "Publish_Doc" fileroom'
  step  'I refresh the screen'
  step 'I double click and get into the "Publish_Doc" fileroom'
end

After('@publish') do |scenario|
  step 'I click on "Cancel" button'
  step 'I should come out of the fileroom'
  step 'TearDown: Delete Fileroom with name of "Publish_Doc"'
  end

###############################Editsecurity_Assign_hook##################################
Before('@assign') do |scenario|
  # step 'I click on the project navigation Documents tab'
  step 'SetUp: create Fileroom with name of "ADoc"'
  step 'Setup: Upload document to the "ADoc" fileroom'
  step  'I refresh the screen'
  step 'I click on the project navigation Documents tab'
  step 'I double click and get into the "ADoc" fileroom'
end

After('@assign') do |scenario|
  step 'I click on "Cancel" button'
  step 'I should come out of the fileroom'
  step 'TearDown: Delete Fileroom with name of "ADoc"'
end

###############################Deactivateuser_hook##################################
Before('@Deactivateuser') do |scenario|
  step 'I click on the project navigation Users tab'
end

After('@Deactivateuser') do |scenario|
 step 'I click on User status and click on inactive users'
 step 'I select the user name "sulla"'
 step 'I select "Activate" option from "Actions" menu'

#   step 'I should come out of the fileroom'
#   step 'TearDown: Delete Fileroom with name of "ADoc"'
end

###############################Activateuser_hook##################################
Before('@Activateuser') do |scenario|
  step 'I click on the project navigation Users tab'
  step 'I select the user name "sulla"'
  step 'I select "Deactivate" option from "Actions" menu'
end

# After('@Activateuser') do |scenario|
#   step 'I click on User status and click on inactive users'
#   step 'I select the user name "sulla"'
#   step 'I select "Activate" option from "Actions" menu'
#
# #   step 'I should come out of the fileroom'
# #   step 'TearDown: Delete Fileroom with name of "ADoc"'
# end


###############################Securityrole_hook##################################
Before('@securityrole') do |scenario|
  step 'I click on the project navigation Documents tab'
end

##############################CreateWatermark_hook##################################

Before('@watermarktemplate') do |scenario|
  step 'I click on the project navigation Settings tab'
end

After('@watermarktemplate') do |scenario|

  step 'i click on "WM_1"'
  step 'I select "Delete" option from "Actions" menu'
end

##############################DeleteWatermark_hook##################################

Before('@Deletewatermarktemplate') do |scenario|
  step 'I click on the project navigation Settings tab'
  step 'i click on New menu'
  step 'i click on Watermark'
  step 'i click on Template Title and enter "WM_1"'
  step 'click on save button'
  step 'click on save button'
end


##############################CopyWatermark_hook##################################

Before('@Copywatermark') do |scenario|
  step 'I click on the project navigation Settings tab'
end

After('@Copywatermark') do |scenario|

  step 'i click on "WM_Copy"'
  step 'I select "Delete" option from "Actions" menu'
end

##############################EnableWatermark_hook##################################

Before('@EnableWatermark') do |scenario|
  step 'SetUp: create Fileroom with name of "Doc_View"'
  step 'Setup: Upload document to the "Doc_View" fileroom'
  step  'I refresh the screen'
  step 'I click on the project navigation Users tab'

end

After('@EnableWatermark') do |scenario|
  step 'i close the viewer'
  step 'I should come out of the fileroom'
  step 'I select the fileroom name "Doc_View"'
  step 'I select "Deactivate Fileroom" option from "Action" menu'
  step 'I click on "Yes" button'
  step 'I select the fileroom name "Doc_View"'
  step 'I select "Delete Fileroom" option from "Action" menu'
  step 'I click on "Yes" button'
  step 'I should not see the "Doc_View" in the grid'
end

########################Copy_property_history_hook####################
Before('@Copypropertyhistory') do |scenario|
  step 'SetUp: create Fileroom with name of "Copy_Doc"'
  step 'Setup: Upload document to the "Copy_Doc" fileroom'
  step 'I select "Folder" option from "New" menu'
  step 'I enter folder name "Folder1" in the text box'
  step  'I refresh the screen'
  step 'I double click and get into the "Copy_Doc" fileroom'
end

 After('@Copypropertyhistory') do |scenario|
  step 'I click on "Close" button'
  step 'I should come out of the fileroom'
  step 'I should come out of the fileroom'
#   step  'I refresh the screen'
  step 'TearDown: Delete Fileroom with name of "Copy_Doc"'
 end

########################Move_property_history_hook####################
Before('@Movepropertyhistory') do |scenario|

  step 'SetUp: create Fileroom with name of "Move_Doc"'
  step 'Setup: Upload document to the "Move_Doc" fileroom'
  step 'I select "Folder" option from "New" menu'
  step 'I enter folder name "Folder1" in the text box'
  step  'I refresh the screen'
  step 'I double click and get into the "Move_Doc" fileroom'
end

After('@Movepropertyhistory') do |scenario|
  step 'I click on "Close" button'
  step 'I should come out of the fileroom'
  step 'I should come out of the fileroom'
  step  'I refresh the screen'
  step 'TearDown: Delete Fileroom with name of "Move_Doc"'
end

########################Copy_differentproperty_history_hook####################

Before('@Copytodifferentpropertyhistory') do |scenario|
  step 'SetUp: create Fileroom with name of "Copy_Doc"'
  step 'SetUp: create Fileroom with name of "C_doc1"'
  step 'Setup: Upload document to the "Copy_Doc" fileroom'
  step  'I refresh the screen'
  step 'I double click and get into the "Copy_Doc" fileroom'

end

After('@Copytodifferentpropertyhistory') do |scenario|
  step 'I click on "Close" button'
  step 'I should come out of the fileroom'
  step 'TearDown: Delete Fileroom with name of "Copy_Doc"'
  step 'TearDown: Delete Fileroom with name of "C_doc1"'
end

########################Move_differentproperty_history_hook####################

Before('@Movetodifferentpropertyhistory') do |scenario|
  step 'SetUp: create Fileroom with name of "Move_Doc"'
  step 'SetUp: create Fileroom with name of "M_doc1"'
  step 'Setup: Upload document to the "Move_Doc" fileroom'
  step  'I refresh the screen'
  step 'I double click and get into the "Move_Doc" fileroom'

end

After('@Movetodifferentpropertyhistory') do |scenario|
  step 'I click on "Close" button'
  step 'I should come out of the fileroom'
  step 'TearDown: Delete Fileroom with name of "Move_Doc"'
  step 'TearDown: Delete Fileroom with name of "M_doc1"'
end

########################Userhistory_Active user_hook####################

Before('@Activateuserhistory') do |scenario|
  step 'I click on the project navigation Users tab'
  step 'I select the user name "sulla"'
  step 'I select "Deactivate" option from "Actions" menu'
end

After('@Activateuserhistory') do |scenario|
step 'I click on "Close" button'
end

########################Userhistory_Deactive user_hook####################

Before('@Deactivateuserhistory') do |scenario|
  step 'I click on the project navigation Users tab'
end

After('@Deactivateuserhistory') do |scenario|
  step 'I click on "Close" button'
  # step 'I click on User status and click on inactive users'
  # step 'I select the user name "sulla"'
  step 'I select "Activate" option from "Actions" menu'

end

########################Z_LastScenario_hook####################

Before('@last') do |scenario|
  step 'I click on the project navigation Users tab'
end

############################### 101_001_Add Fileroom_hook##################################

After('@addfileroom') do |scenario|
  step 'TearDown: Delete Fileroom with name of "CreateFileroom"'
end
#################################################################



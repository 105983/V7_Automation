## This file will have the common steps ##
require 'yaml'
require 'os'
config = YAML.load_file("#{$filePath}object-repository.yaml")

############################################################################
#   Common steps for login                                                 #
############################################################################

 Given(/^I open the app$/) do
  visit '/'
  page.driver.browser.manage.window.maximize
  sleep(1)
end

# When(/^I click on project ([^"]*)$/) do |project|
#   within(:xpath, "//li[@class='carousel-container-project']/div[contains(text(),'" + project + "']") do
#     find(:xpath, "//a[contains(text(),'DOCUMENTS']").click
#   end
# end

When(/^I enter username ([^"]*) and password ([^"]*)$/) do |username, password|
  fill_in 'loginUsername', :with => username
  fill_in 'loginPassword', :with => password
  click_button 'Login'
  sleep 5

 # step "I need to wait progress div"
end

# Then(/^I need to wait progress div$/) do
#   res = true
#   for i in 0..16
#     sleep(1)
#     elClass = page.find(:xpath, config['progressIcon']['loadingIcon'],:visible=> false)[:class]
#     # puts elClass
#     if elClass.eql? "ext-webkit ext-chrome x-border-layout-ct"
#       res = true
#       break
#     end
#   end
#   expect(res).to be_truthy
# end


# Then(/^the project navigation bar should be present$/) do
#   sleep(4)
#   expect(page).to have_xpath("//span[contains(text(), 'DOCUMENTS')]", wait:40)
#   step "User clicks on aDocuments tab"
#
# end


Then(/^I click on the project navigation ([^"]*) tab$/) do |tabName|
  page.click_on tabName
  sleep 2

  #first(:xpath,"//span[contains(text(),#{tabName})]").click

  if (tabName == "Users")
    sleep 2.5
    expect(page).to have_content "All Users"

    # step "bUsers tab should be open"
  end
  if (tabName == "Alerts")
    sleep 2.5
    expect(page).to have_content "Alerts"

    # step "bUsers tab should be open"
  end
  if (tabName == "Settings")
    sleep 2.5
    expect(page).to have_content "Settings"
    # step "Permissions tab should be open"
  end
  if (tabName == "Documents")

    sleep 2.5
    expect(page).to have_content "Content"

    #step "I click on New Action menu and Fill in Fileroom details"
    #step "I click on New menu"
    #step "aDocuments tab should be open"
  end

  if (tabName == "Reports")
    step "Reports tab should be open"
  end
end

Then(/^I should be on the login page$/) do
  #reload_page()
  expect(page).to have_content('Login', wait:20)
end

Then(/^I log out$/) do
  sleep(10)
    find(:xpath, config['documents_obj']['logoutallENV'], wait:20).click
    expect(page).to have_content('Logout')
    find(:xpath, config['documents_obj']['logoutv7'], wait:20).click
end



Given(/^Load the tracker login page$/) do
  if ENV['env'] == 'test'
    visit 'https://ds-test1-internal.stp.mrll.com'
  elsif ENV['env'] == 'stage'
    visit 'https://datasite-stage.ber1.mrll.com'
  elsif ENV['env'] == 'prod'
    visit 'https://datasite-prod.ber1.mrll.com'
  end
end


When(/^I enter  username and password$/) do
  sleep(2)
  if ENV['env'] == 'prod'
    # index = rand(1..10)
    # step "I enter username kittusdad+#{index}@gmail.com and password Prodfull001111"
    step "I enter username 105983 and password Prodtracker0012222"
  elsif ENV['env'] == 'test'
    step "I enter username 105983 and password Prodtracker0012222"
  elsif ENV['env'] == 'stage'
    step "I enter username 105983 and password Prodtracker0012222"
  end
end

When(/^I enter username and password$/) do
  sleep(2)
  if ENV['env'] == 'prod'
    # index = rand(1..10)
    # step "I enter username kittusdad+#{index}@gmail.com and password Prodfull001111"
    step "I enter username kittusdad+65233@gmail.com and password Prodfull0011112222"
  elsif ENV['env'] == 'test'
    step "I enter username kittusdad+65233@gmail.com and password Prodfull001111222"
  elsif ENV['env'] == 'stage'
    step "I enter username kittusdad+65233@gmail.com and password Prodfull0011112222"
  end
end




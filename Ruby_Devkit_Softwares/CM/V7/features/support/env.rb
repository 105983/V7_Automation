require "capybara/cucumber"
require "selenium/webdriver"
#require 'sauce_whisk'
require 'yaml'
require 'os'

$filePath
usrCur = Dir.pwd
if OS.windows?
  if usrCur.include? "V7"
    $filePath = usrCur.gsub('/','\\')+"\\features\\support\\"
  else
    $filePath = usrCur.gsub('/','\\')+"\\CM\\V7\\features\\support\\"
  end
elsif OS.linux?
  if usrCur.include? "V7"
    $filePath = usrCur.gsub('/','/')+"/features/support/"

  end
end

#ENV['env'] ||= "Test"

#ENV['env'] ||= "test"
# ENV['env'] ||= "prod"
 ENV['env'] ||= "stage"

if ENV['env'] == 'test'
  Capybara.app_host='https://ds-test1.stp.mrll.com'
elsif ENV['env'] == 'stage'
  Capybara.app_host='https://datasite-stage.merrillcorp.com'
elsif ENV['env'] == 'prod'
  Capybara.app_host='https://datasite-prod.merrillcorp.com/'
end

ENV['run'] ||= 'local'
ENV['browser'] ||= 'chrome'
if ENV['run'] == 'local'

    case
      when ENV['browser'] == 'chrome'
        Capybara.default_driver = :chrome
        Capybara.javascript_driver = :selenium
      Capybara.register_driver :chrome do |app|
        options = {
           :js_errors => false,
            :timeout => 360,
            :debug => false,
            :inspector => false,
        }
        caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--start-maximized" ]})
        Capybara::Selenium::Driver.new(app, {:browser => :chrome, :desired_capabilities => caps})
      end

      when  ENV['browser'] == 'ie'
        Capybara.register_driver :selenium do |app|
          Capybara::Selenium::Driver.new(app,
                                         :browser => :internet_explorer

          )
        end
    when  ENV['browser'] == 'firefox'
      Capybara.default_driver = :firefox
      Capybara.register_driver :firefox do |app|

        profile = Selenium::WebDriver::Firefox::Profile.new
        Capybara::Selenium::Driver.new(app, {:browser => :firefox, :profile => profile})
      end
    when ENV['browser']=='safari'
      Capybara.default_driver = :safari
      Capybara.register_driver :safari do |app|
        options = {
            :js_errors => false,
            :timeout => 360,
            :debug => false,
            :inspector => false,
        }
        Capybara::Selenium::Driver.new(app, :browser => :safari)
      end
    end
    
elsif ENV['run'] == 'sauce'
  sauceuser ='sriramgopalan'
  saucekey = '4b6e026d-9c46-4b5c-ab32-23d9d58a848e'

  url = "http://#{sauceuser}:#{saucekey}@ondemand.saucelabs.com:80/wd/hub".strip


  Capybara.javascript_driver = :selenium
  Capybara.default_driver= :selenium
  Capybara.register_driver :selenium do |app|
    capabilities={
        #:idleTimeout => 600,
        :browserName => ENV['browser'],
        :version => '57',
        :platform =>  'Windows 7',
        :screenResolution=> '1920x1080'
    }
    Capybara::Selenium::Driver.new(app,
                                   :browser => :remote,
                                   :url=>url,
                                   :desired_capabilities=>capabilities)
  end

end

# Sauce.config do |c|
#   c[:browsers] = [[ 'Chrome','']]
# end

   Selenium::WebDriver::Driver.class_eval do
      def quit
        STDOUT.puts "#{self.class}#I am out!!!"
      end
   end

Capybara::Selenium::Driver.class_eval do
  def reset!
  end
end

#To Generate the Status of the scenario with runtime
scenario_times = {}
Around() do |scenario, block|
  start = Time.now
  block.call
  file = scenario.feature.file
  scenario_times["#{scenario.name}|#{@scenariodata}"] = Time.now - start
end

After do |scenario|
  @scenariodata= scenario.status
end

def automationstart
  Time.now.strftime("%Y-%m-%d_%H%M%S")
end
at_exit do
  max_scenarios = scenario_times.size > 20 ? 20 : scenario_times.size
  total_scenario = scenario_times.size
  sorted_times = scenario_times.sort { |a, b| b[1] <=> a[1] } #If need to sort by time consumed in desending order .
  # sorted_times = scenario_times.sort { |a, b| a[1] <=> b[1] } #If need to sort by time consumed in ascending order.
  # sorted_times = scenario_times.sort_by {|x|[x.filename] }
  # sorted_times[0..max_scenarios - 1].each do |key, value|
  TimeConsumed = File.new("#{File.join("C:/Ruby_Devkit_Softwares/CM/V7/features/output/", "Scenario_Execution_Status#{automationstart}.txt")}", "a")
  sorted_times[0..total_scenario - 1].each do |key, value|
    TimeConsumed.write("#{value.round(2)}|#{key}\n")
  end
  TimeConsumed.close
end

Capybara.default_max_wait_time = 10



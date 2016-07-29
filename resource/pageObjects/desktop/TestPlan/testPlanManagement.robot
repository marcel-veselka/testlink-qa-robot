*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${buttonCreateTestPlan}  create_testplan

*** Keywords ***

Create Test Plan Management
    select frame  mainframe
    wait until page contains element  ${buttonCreateTestPlan}
    click button  ${buttonCreateTestPlan}
    unselect frame

Check Test Plan Management is Created ${TestPlanName}
    select frame  mainframe
    wait until page contains  Test Plan Management
    wait until page contains element  xpath=//a[contains(text()," ${TestPlanName} ")]
    unselect frame



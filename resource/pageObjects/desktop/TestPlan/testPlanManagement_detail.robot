*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      ff


*** Keywords ***

Input Name
    [Arguments]   ${TestPlanManagementName}

     select frame  name=mainframe
     wait until page contains  testplan_name
    input text  testplan_name  ${TestPlanManagementName}
    unselect frame

Input Description

    sleep  1
    select frame  name=mainframe
    wait until page contains  Description
    click element  cke_8_label
    input text  xpath=//*[@id="cke_contents_notes"]/textarea  ${TPMDescription}
    unselect frame

Select Checkbox Active

    select frame  name=mainframe
    select checkbox  active
    unselect frame

Select Checkbox Public

    select frame  name=mainframe
    select checkbox  is_public
    unselect frame

Click Create button to finish Test Plan Management

    select frame  mainframe
    click button  Create
    unselect frame


Click Button Delete Test Plan Management
    [Arguments]  ${TestPlanManagementNameToDelete}

    select frame  mainframe
    wait until page contains  ${TestPlanManagementNameToDelete}
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanManagementNameToDelete}')]]/td[last()]/img[1]
    unselect frame

Confirm Delete Test Plan Management

    select frame  mainframe
    click button  Yes
    unselect frame

Check Test Plan Management Deleted
    [Arguments]  ${TestPlanManagementNameToDelete}

    select frame  mainframe
    page should not contain  ${TestPlanManagementNameToDelete}
    unselect frame

Create from existing Test Plan?

    select frame  mainframe
    wait until page contains  Create from existing Test Plan?
    click element  copy_from_tplan_id
    click element  xpath=//*[@id="testplan_mgmt"]/table/tbody/tr[3]/td/select/option[2]
    unselect frame

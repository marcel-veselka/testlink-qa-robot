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
    wait until page contains element  testplan_name
    input text  testplan_name  ${TestPlanManagementName}
    unselect frame

Input Description

    select frame  name=mainframe
    wait until page contains  Description
    wait until page contains element  xpath=//iframe[@title="Rich text editor, notes"]
    mouse down  xpath=//iframe[@title="Rich text editor, notes"]
    mouse up  xpath=//iframe[@title="Rich text editor, notes"]
    #click element  cke_8_label
    select frame  xpath=//iframe[@title="Rich text editor, notes"]
    input text  xpath=//body  ${TestPlanManagementDescription}
    #input text  xpath=//*[@id="cke_contents_notes"]/textarea  ${TestPlanManagementDescription}
    unselect frame

wait until page contains all checkboxes from existing Test Plan

    select frame  mainframe
    wait until page contains  Copy User Roles
    wait until page contains  Copy Attachments
    wait until page contains  Copy Test Cases
    wait until page contains  Copy Builds
    wait until page contains  Copy Platforms Links
    wait until page contains  Copy Milestones
    unselect frame



Select Checkbox Active

    select frame  name=mainframe
    wait until page contains element  name=active
    select checkbox  active
    unselect frame

Select Checkbox Public

    select frame  name=mainframe
    wait until page contains element  name=is_public
    select checkbox  is_public
    unselect frame

unselect checkbox Public

    select frame  name=mainframe
    unselect checkbox  is_public
    unselect frame

unselect checkbox Active

    select frame  name=mainframe
    unselect checkbox  active
    unselect frame

unselect checkbox Copy User Roles

    select frame  name=mainframe
    unselect checkbox  copy_user_roles
    unselect frame

unselect checkbox Copy Test Cases

    select frame  name=mainframe
    unselect checkbox  copy_tcases
    unselect frame

unselect checkbox Copy Attachements

    select frame  name=mainframe
    unselect checkbox  copy_attachments
    unselect frame

unselect checkbox Copy Builds

    select frame  name=mainframe
    unselect checkbox  copy_builds
    unselect frame

unselect checkbox Copy Platforms Links

    select frame  name=mainframe
    unselect checkbox  copy_platforms_links
    unselect frame

unselect checkbox Copy Milestones

    select frame  name=mainframe
    unselect checkbox  copy_milestones
    unselect frame

Click Create button to finish Test Plan Management

    select frame  mainframe
    wait until page contains element  do_create
    click button  Create
    unselect frame

Warning Message Creating Same Test Plan Management

    select frame  mainframe
    wait until page contains  There is already a Test Plan with this name. Please choose another name!
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



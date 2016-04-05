*** Settings ***

Documentation  This is the resource file containing all methods based on create project page
Library        Selenium2Library
Library        BuiltIn

*** Variables ***
${newTestProjectDescription}  New test project description
${issueTrackerName}


*** Keywords ***


Wait until page contains all elements
    select frame  mainframe
    wait until page contains element  copy_from_tproject_id
    wait until page contains element  tprojectName
    wait until page contains element  tcasePrefix
    wait until page contains element  xpath=//*[@id="item_view"]/tbody/tr[4]/td[2]/textarea
    wait until page contains element  optReq
    wait until page contains element  optPriority
    wait until page contains element  optAutomation
    wait until page contains element  optInventory
    wait until page contains element  active
    wait until page contains element  is_public
    wait until page contains element  go_back
    wait until page contains element  doActionButton
    unselect frame

Check Create Test Project page
    Wait until page contains all elements

Click Template
    click element  copy_from_tproject_id

Choose from template
    select from list by label  copy_from_tproject_id  ${newTestProjectName}

Choose no template
    select from list by label  copy_from_tproject_id  No

Choose template from created project
    select from list by label  copy_from_tproject_id  ${newTestProjectName}

Fill Test Project Name
    [Arguments]  ${newTestProjectName}
    input text  tprojectName  ${newTestProjectName}

Fill Test Project Prefix
    [Arguments]  ${newTestProjectPrefix}
    input text  tcasePrefix  ${newTestProjectPrefix}

Click Issue Tracker
    click element  issue_tracker_id

Choose from Issue Tracker
    select from list by label  issue_tracker_id  ${issueTrackerName}

Click Cancel
    select frame  mainframe
    click button  Cancel
    unselect frame

Click Create
    select frame  mainframe
    wait until page contains  Create
    click button  Create
    unselect frame

Warning message is not here
    page should not contain  There's already Test Project named ${newTestProjectName}
    page should not contain  Test Case ID prefix ${newTestProjectPrefix} already exists

Select Create From Existing Projects = No
    select from list  copy_from_tproject_id  0

Unselect all features
    unselect checkbox  optReq
    unselect checkbox  optPriority
    unselect checkbox  optAutomation
    unselect checkbox  optInventory

Confirm warning about empty fields
    select frame  mainframe
    wait until page contains   cannot be empty!
    click button  OK
    unselect frame

Select Unselected Checkboxes
    select checkbox  optReq
    select checkbox  optInventory

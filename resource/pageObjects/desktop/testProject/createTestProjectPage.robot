*** Settings ***

Documentation  This is the resource file containing all methods based on create project page
Library        Selenium2Library
Library        BuiltIn

*** Variables ***

${elementCopyFromTP}            copy_from_tproject_id
${elementTPProject}             tprojectName
${elementTCPrefix}              tcasePrefix
${elementOptReq}                optReq
${elementOptPriority}           optPriority
${elementOptAutomation}         optAutomation
${elementOptInventory}          optInventory

*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains element  ${elementCopyFromTP}
    wait until page contains element  ${elementTPProject}
    wait until page contains element  ${elementTCPrefix}
    wait until page contains element  xpath=//*[@id="item_view"]/tbody/tr[4]/td[2]/textarea
    wait until page contains element  ${elementOptReq}
    wait until page contains element  ${elementOptPriority}
    wait until page contains element  ${elementOptAutomation}
    wait until page contains element  ${elementOptInventory}
    wait until page contains element  active
    wait until page contains element  is_public
    wait until page contains element  go_back
    wait until page contains element  doActionButton
    unselect frame

Choose no template
    select frame  mainframe
    select from list by label  ${elementCopyFromTP}  No
    unselect frame

Choose template from created project
    select frame  mainframe
    select from list by label  ${elementCopyFromTP}  ${newTestProjectName1}
    unselect frame

Fill Test Project Name
    [Arguments]  ${newTestProjectName}
    select frame  mainframe
    input text  ${elementTPProject}  ${newTestProjectName}
    unselect frame

Fill Test Project Prefix
    [Arguments]  ${newTestProjectPrefix}
    select frame  mainframe
    input text  ${elementTCPrefix}  ${newTestProjectPrefix}
    unselect frame

Click Create
    select frame  mainframe
    wait until page contains  Create
    click button  Create
    unselect frame

No warning about existing projects
    page should not contain  There's already Test Project named ${newTestProjectName}
    page should not contain  Test Case ID prefix ${newTestProjectPrefix} already exists

Select Create From Existing Projects = No
    select frame  mainframe
    select from list  ${elementCopyFromTP}  0
    unselect frame

Unselect all features
    select frame  mainframe
    unselect checkbox  ${elementOptPriority}
    unselect checkbox  ${elementOptAutomation}
    unselect checkbox  ${elementOptInventory}
    unselect frame

Select Unselected Checkboxes
    select frame  mainframe
    select checkbox  ${elementOptReq}
    select checkbox  ${elementOptInventory}
    unselect frame

Fill all information about ${newTestProjectName} ${newTestProjectPrefix}
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}
    createTestProjectPage.Select Unselected Checkboxes

Fill information to create test without conflict ${newTestProjectName} ${newTestProjectPrefix}
    wait until keyword succeeds  1min  0  createTestProjectPage.I am here
    createTestProjectPage.Fill all information about ${newTestProjectName} ${newTestProjectPrefix}

Fill information to create test with template OFF
    createTestProjectPage.I am here
    createTestProjectPage.Choose no template
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}

Fill information to create test with template ON
    wait until keyword succeeds  1min  0  createTestProjectPage.I am here
    createTestProjectPage.Choose template from created project
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}

Fill information to create test (enchanced feautures)
    wait until keyword succeeds  1min  0  createTestProjectPage.I am here
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}
    createTestProjectPage.Select Create From Existing Projects = No
    createTestProjectPage.Unselect all features


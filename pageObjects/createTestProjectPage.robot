*** Settings ***

Documentation  This is the resource file containing all methods based on create test project page
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      chrome
${projectTemplate}  No
${newTestProjectName}  testingProjectNew1
${newTestProjectPrefix}  prefixNew1


*** Keywords ***

Click Test template dropdown
    click element  copy_from_tproject_id

Choose from test template dropdown
    select from list by label  copy_from_tproject_id  ${projectTemplate}

Fill Test project name
    input text  tprojectName  ${newTestProjectName}

Fill Test project prefix
    input text  tcasePrefix  ${newTestProjectPrefix}

Wait until page contains all elements
    wait until page contains element  copy_from_tproject_id
    wait until page contains element  tprojectName
    wait until page contains element  tcasePrefix
    wait until page contains element  xpath=//tbody/tr[contains(td, "Project description")]//tbody
    wait until page contains element  optReq
    wait until page contains element  optPriority
    wait until page contains element  optAutomation
    wait until page contains element  optInventory
    wait until page contains element  issue_tracker_enabled
    wait until page contains element  issue_tracker_id
    wait until page contains element  active
    wait until page contains element  is_public
    wait until page contains element  doActionButton
    wait until page contains element  go_back

Submit project
    click button  Create
    sleep  3



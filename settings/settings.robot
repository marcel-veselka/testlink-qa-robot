*** Settings ***
Documentation  Settings for creating testing data for all test suites.


Resource       ../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../resource/helper/desktopHeaderSystem.robot
Resource       ../../resource/helper/desktopHeaderSpecification.robot
Resource       ../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../resource/helper/desktopHeaderHelper.robot

*** Variables ***

${LOGIN}                            admin
${PASSWORD}                         admin
${SERVER}               testlab.tesena.com/testlink
${DELAY}                0
${LOGIN URL}            http://${SERVER}/login.php
${WELCOME URL}          http://${SERVER}/index.php?caller=login
${ERROR URL}            http://${SERVER}/login.php
${BROWSER}              ff
${elementLogin}         login
${loginSubmit}          login_submit
${indexPage}            xpath=//img[@title="logo"]
${elementPassword}      tl_password
${css}                  css=div.messages_rounded
${HOSTNAME}               home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt
${newTestProjectName}     tryit
${newTestProjectPrefix}   tryit
${elementCopyFromTP}            copy_from_tproject_id
${elementTPProject}             tprojectName
${elementTCPrefix}              tcasePrefix
${elementOptReq}                optReq
${elementOptPriority}           optPriority
${elementOptAutomation}         optAutomation
${elementOptInventory}          optInventory
${userManagement}           xpath=//img[@title="User Management"]
${indexPage}                xpath=//img[@title="logo"]

*** Test Cases ***

Login as admin default
    loginPage.Open Browser To Login Page TRAVIS
    wait until keyword succeeds  1min  0  loginPage.Wait until page contains all elements for login
    Fill credentials and submit ${LOGIN} ${PASSWORD}

Create TP
    select frame  mainframe
    wait until page contains element  ${elementTPProject}
    wait until page contains element  ${elementTCPrefix}
    wait until page contains element  ${elementOptReq}
    wait until page contains element  ${elementOptInventory}
    unselect frame
    capture page screenshot
    select frame  mainframe
    input text  ${elementTPProject}  ${newTestProjectName}
    input text  ${elementTCPrefix}  ${newTestProjectPrefix}
    select checkbox  ${elementOptReq}
    select checkbox  ${elementOptInventory}
    click button  Create
    unselect frame
    select frame  mainframe
    sleep  2
    capture page screenshot
    unselect frame

Create new user
    select frame  titlebar
    wait until page contains element  ${indexPage}
    click element  ${indexPage}
    unselect frame
    select frame  mainframe
    sleep  2
    capture page screenshot
    unselect frame
    select frame  titlebar
    click element  ${userManagement}
    sleep  2
    capture page screenshot
    unselect frame
    wait until page contains element  doCreate
    click element  doCreate
    wait until page contains element  lastName
    input text  lastName  renat.kulalov
    wait until page contains element  password
    input text  password  renat123
    wait until page contains element  rights_id
    select from list by label  rights_id  admin
    wait until page contains element  locale
    select from list by label  locale  English (wide/UK)
    wait until page contains element  authentication
    select from list by label  authentication  Default(DB)
    select checkbox  user_is_active
    wait until page contains element  do_update
    click element  do_update
    close browser




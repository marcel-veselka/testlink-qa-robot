*** Settings ***
Documentation  Settings for creating testing data for all test suites.


Resource       ../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../resource/helper/desktopHeaderTestPlan.robot
Resource       ../resource/helper/desktopHeaderSystem.robot
Resource       ../resource/helper/desktopHeaderSpecification.robot
Resource       ../resource/helper/desktopHeaderPlanContent.robot
Resource       ../resource/helper/desktopHeaderHelper.robot

*** Variables ***

${LOGIN}                            admin
${PASSWORD}                         admin
${SERVER}                           testlab.tesena.com/testlink
${DELAY}                            0
${LOGIN URL}                        http://${SERVER}/login.php
${WELCOME URL}                      http://${SERVER}/index.php?caller=login
${ERROR URL}                        http://${SERVER}/login.php
${BROWSER}                          ff
${elementLogin}                     login
${loginSubmit}                      login_submit
${indexPage}                        xpath=//img[@title="logo"]
${elementPassword}                  tl_password
${css}                              css=div.messages_rounded
${HOSTNAME}                         home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt
${newTestProjectName}               tryit
${newTestProjectPrefix}             tryit
${elementCopyFromTP}                copy_from_tproject_id
${elementTPProject}                 tprojectName
${elementTCPrefix}                  tcasePrefix
${elementOptReq}                    optReq
${elementOptPriority}               optPriority
${elementOptAutomation}             optAutomation
${elementOptInventory}              optInventory
${userManagement}                   xpath=//img[@title="Users/Roles"]
${indexPage}                        xpath=//img[@title="logo"]
${xpathTable}                   xpath=//table[@id="item_view"]

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
    wait until page contains element  doActionButton
    wait until page contains element  ${elementOptInventory}
    wait until page contains  Create a new project
    input text  ${elementTPProject}  ${newTestProjectName}
    input text  ${elementTCPrefix}  ${newTestProjectPrefix}
    select checkbox  ${elementOptReq}
    select checkbox  ${elementOptInventory}
    click button  doActionButton
    unselect frame

Check new project exists
    select frame  mainframe
    wait until page contains element  ${xpathTable}
    element should contain  ${xpathTable}   ${newTestProjectName}
    unselect frame

Create Renat new user
    select frame  titlebar
    wait until page contains element  ${indexPage}
    click element  ${indexPage}
    unselect frame
    select frame  titlebar
    click element  ${userManagement}
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//span[contains(text(),"View Users")]
    wait until page contains element  xpath=//input[@name="doCreate"]
    click element  xpath=//input[@name="doCreate"]
    unselect frame
    select frame  mainframe
    wait until page contains element  lastName
    wait until page contains element  password
    wait until page contains element  rights_id
    wait until page contains element  locale
    wait until page contains element  authentication
    wait until page contains element  do_update
    input text  lastName  renat.kulalov
    input text  password  renat123
    select from list by label  rights_id  admin
    select from list by label  locale  English (wide/UK)
    select from list by label  authentication  Default(DB)
    select checkbox  user_is_active
    click element  do_update
    unselect frame

Create Vojta new user
    select frame  titlebar
    wait until page contains element  ${indexPage}
    click element  ${indexPage}
    unselect frame
    select frame  titlebar
    click element  ${userManagement}
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//span[contains(text(),"View Users")]
    wait until page contains element  xpath=//input[@name="doCreate"]
    click element  xpath=//input[@name="doCreate"]
    unselect frame
    select frame  mainframe
    wait until page contains element  firstName
    wait until page contains element  emailAddress
    wait until page contains element  lastName
    wait until page contains element  password
    wait until page contains element  rights_id
    wait until page contains element  locale
    wait until page contains element  authentication
    wait until page contains element  do_update
    input text  firstName  karel
    input text  lastName  karel
    input text  password  vojta123
    input text  emailAddress  email@email.com
    select from list by label  rights_id  guest
    select from list by label  locale  Czech
    select checkbox  user_is_active
    click element  do_update
    unselect frame

Create Jan new user
    select frame  titlebar
    wait until page contains element  ${indexPage}
    click element  ${indexPage}
    unselect frame
    select frame  titlebar
    click element  ${userManagement}
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//span[contains(text(),"View Users")]
    wait until page contains element  xpath=//input[@name="doCreate"]
    click element  xpath=//input[@name="doCreate"]
    unselect frame
    select frame  mainframe
    wait until page contains element  firstName
    wait until page contains element  emailAddress
    wait until page contains element  lastName
    wait until page contains element  password
    wait until page contains element  rights_id
    wait until page contains element  locale
    wait until page contains element  authentication
    wait until page contains element  do_update
    input text  emailAddress  jan.pippal@tesena.com
    input text  firstName  Jan
    input text  lastName  Pippal
    input text  password  jan123
    select from list by label  rights_id  guest
    select from list by label  locale  Czech
    select checkbox  user_is_active
    click element  do_update
    unselect frame
    close browser



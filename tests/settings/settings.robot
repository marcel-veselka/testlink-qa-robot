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
${HOSTNAME}             home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt

*** Test Cases ***

Login as admin default
    loginPage.Open Browser To Login Page TRAVIS
    wait until keyword succeeds  1min  0  loginPage.Wait until page contains all elements for login
    Fill credentials and submit ${LOGIN} ${PASSWORD}

Create new user
    HeaderPage Go to ${indexPage}
    HeaderPage Go to ${userManagement}
    wait until page contains element  doCreate
    click element  doCreate
    wait until page contains element  lastName
    input text  lastName  renat.kulalov
    wait until page contians element  password
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




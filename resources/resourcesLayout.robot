*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library
#zkuska

*** Variables ***
${LINKTOBLOCK}   lib/cfields/cfieldsView.php
${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}       ff
${KEYWORD}      ART
*** Keywords ***
Open Browser To Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Capture Page Screenshot
    Title Should Be  TestLink

Login as Admin
    input text  login  renat.kulalov
    input text  tl_password  renat123

Submit Credentials
    Click Button  login_submit



Check My settings
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[2]/span[2]/a[1]
    unselect frame
    select frame  name=mainframe
    page should contain  Account Settings
    unselect frame
    go back

Check Descktop
    sleep  3
    select frame  name=mainframe
    page should contain  Define Custom Fields
    unselect frame

Check Test Specification
    sleep  3
    select frame  name=mainframe
    click link  Test Specification
    sleep  3
    select frame  name=treeframe
    wait until page contains  Navigator - Test Specification
    unselect frame
    go back

Check Execute tests
    sleep  3
    select frame  name=titlebar
    select from list  testproject  1
    unselect frame
    select frame  name=mainframe
    click link  Execute Tests
    sleep  3
    select frame  name=treeframe
    wait until page contains  Execute Tests
    unselect frame
    go back

Check Test Reports
    sleep  3
    select frame  name=titlebar
    select from list  testproject  1
    unselect frame
    select frame  name=mainframe
    click link  Test Reports and Metrics
    sleep  3
    select frame  name=treeframe
    wait until page contains  Reports and Metrics
    unselect frame
    go back

Check User Roles
    sleep  3
    select frame  name=titlebar
    select from list  testproject  1
    unselect frame
    select frame  name=mainframe
    click link  Assign User Roles
    sleep  3
    wait until page contains  User Management - Assign roles
    unselect frame
    go back

Check Events
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[7]
    unselect frame
    select frame  name=mainframe
    page should contain  Event viewer
    unselect frame
    go back

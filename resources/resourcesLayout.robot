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

Check Desktop (Project)
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[1]
    unselect frame
    select frame  name=mainframe
    page should contain  System
    page should contain  Test Project
    unselect frame
    go back

Check Requirement Specification (titlebar)
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[2]
    unselect frame
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Navigator - Requirement Specifications
    unselect frame
    go back

Check Test Specification
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[3]
    unselect frame
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Navigator - Test Specification
    unselect frame
    go back

Check Test Execution
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[4]
    unselect frame
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Execute Tests
    unselect frame
    go back

Check Test Reports
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[5]
    unselect frame
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Reports and Metrics
    unselect frame
    go back

Check User Management
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[6]
    unselect frame
    select frame  name=mainframe
    wait until page contains  User Management
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

Check Define Custom Fields
    sleep  3
    select frame  name=mainframe
    click link  Define Custom Fields
    wait until page contains  Custom fields
    unselect frame
    go back

Check Issue Tracker Management
    sleep  3
    select frame  name=mainframe
    click link  Issue Tracker Management
    wait until page contains element  create
    unselect frame
    go back

Check Test Project Management
    sleep  3
    select frame  name=mainframe
    click link  Test Project Management
    wait until page contains  Test Project Management
    wait until page contains element  search
    unselect frame
    go back

Check Assign User Roles
    sleep  3
    select frame  name=mainframe
    click link  Assign User Roles
    wait until page contains  Assign Test Project roles
    wait until page contains element  do_update
    unselect frame
    go back

Check Assign Custom Fields
    sleep  3
    select frame  name=mainframe
    click link  Assign Custom Fields
    wait until page contains  Assign custom fields
    wait until page contains element  doAssign
    unselect frame
    go back

Check Keyword Management
    sleep  3
    select frame  name=mainframe
    click link  Keyword Management
    wait until page contains  Keyword Management
    wait until page contains element  create_keyword
    unselect frame
    go back

Check Platform Management
    sleep  3
    select frame  name=mainframe
    click link  Platform Management
    wait until page contains  Platform Management
    wait until page contains element  create_platform
    unselect frame
    go back

Check Requirement Specification (mainframe)
    sleep  3
    select frame  name=mainframe
    click link  Requirement Specification
    select frame  name=treeframe
    wait until page contains  Navigator - Requirement Specifications
    unselect frame
    go back

Check Requirement Overview
    sleep  3
    select frame  name=mainframe
    click link  Requirement Overview
    wait until page contains  Requirement Overview - Number of Requirements
    unselect frame
    go back

Check Search Requirements
    sleep  3
    select frame  name=mainframe
    click link  Search Requirements
    select frame  name=workframe
    wait until page contains  Requirement Search Page
    unselect frame
    go back

Check Search Requirement Specifications
    sleep  3
    select frame  name=mainframe
    click link  Search Requirement Specifications
    select frame  name=workframe
    wait until page contains  Requirement Specification Search Page
    unselect frame
    go back

Check Assign Requirements
    sleep  3
    select frame  name=mainframe
    click link  Assign Requirements
    select frame  name=workframe
    wait until page contains  Assign Requirements to Test Case
    unselect frame
    go back

Check Generate Requirement Specification Document
    sleep  3
    select frame  name=mainframe
    click link  Generate Requirement Specification Document
    select frame  name=workframe
    wait until page contains  Print Requirement Specification
    unselect frame
    go back

Change Test Project
    sleep  3
    select frame  name=titlebar
    select from list  testproject  1
    unselect frame

Check Current Project
    select frame  name=mainframe
    page should not contain  Execute Tests
    unselect frame

Check New Project
    select frame  name=mainframe
    wait until page contains  Execute Tests
    unselect frame

Check info
    select frame  name=mainframe
    click element  xpath=/html/body/div[1]/div[1]/img
    wait until page contains element  tlhelp
    unselect frame
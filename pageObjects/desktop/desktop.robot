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
Go to index page
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[1]/a
    unselect frame
Go to My Settings
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[2]/span[2]/a[1]
    unselect frame

Check My Settings
    sleep  3
    select frame  name=mainframe
    page should contain  Account Settings
    unselect frame
    go back

Go to Desktop (Project)
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[1]
    unselect frame
Check Desktop (Project)
    sleep  3
    select frame  name=mainframe
    page should contain  System
    page should contain  Test Project
    unselect frame
    go back

Go to Requirement Specification (titlebar)
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[2]
    unselect frame

Check Requirement Specification (titlebar)
    sleep  3
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Navigator - Requirement Specifications
    unselect frame
    go back

Go to Test Specification (titlebar)
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[3]
    unselect frame

Check Test Specification (titlebar)
    sleep  3
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Navigator - Test Specification
    unselect frame
    go back

Go to Test Execution
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[4]
    unselect frame

Check Test Execution
    sleep  3
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Execute Tests
    unselect frame
    go back

Go to Test Reports
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[5]
    unselect frame

Check Test Reports
    sleep  3
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Reports and Metrics
    unselect frame
    go back

Go to User Management
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[6]
    unselect frame

Check User Management
    sleep  3
    select frame  name=mainframe
    wait until page contains  User Management
    unselect frame
    go back

Go to Events
    sleep  3
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[7]
    unselect frame

Check Events
    sleep  3
    select frame  name=mainframe
    page should contain  Event viewer
    unselect frame
    go back

Go to Define Custom Fields
    sleep  3
    select frame  name=mainframe
    click link  Define Custom Fields
    unselect frame

Go to Issue Tracker Management
    sleep  3
    select frame  name=mainframe
    click link  Issue Tracker Management
    unselect frame

Go to Test Project Management
    sleep  3
    select frame  name=mainframe
    click link  Test Project Management
    unselect frame

Go to Assign User Roles
    sleep  3
    select frame  name=mainframe
    click link  Assign User Roles
    unselect frame

Go to Assign Custom Fields
    sleep  3
    select frame  name=mainframe
    click link  Assign Custom Fields
    unselect frame

Go to Keyword Management
    sleep  3
    select frame  name=mainframe
    click link  Keyword Management
    unselect frame

Go to Platform Management
    sleep  3
    select frame  name=mainframe
    click link  Platform Management
    unselect frame

Go to Requirement Specification (mainframe)
    sleep  3
    select frame  name=mainframe
    click link  Requirement Specification
    unselect frame

Go to Requirement Overview
    sleep  3
    select frame  name=mainframe
    click link  Requirement Overview
    unselect frame

Go to Search Requirements
    sleep  3
    select frame  name=mainframe
    click link  Search Requirements
    unselect frame

Go to Search Requirement Specifications
    sleep  3
    select frame  name=mainframe
    click link  Search Requirement Specifications
    unselect frame

Go to Assign Requirements
    sleep  3
    select frame  name=mainframe
    click link  Assign Requirements
    unselect frame

go to Generate Requirement Specification Document
    sleep  3
    select frame  name=mainframe
    click link  Generate Requirement Specification Document
    unselect frame

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
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
    select frame  name=titlebar
    click element  xpath=/html/body/div[1]/a
    unselect frame
Go to My Settings
    select frame  name=titlebar
    click element  xpath=/html/body/div[2]/span[2]/a[1]
    unselect frame

Check My Settings
    select frame  name=mainframe
    page should contain  Account Settings
    unselect frame

Go to Desktop (Project)
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[1]
    unselect frame
Check Desktop (Project)
    select frame  name=mainframe
    page should contain  System
    page should contain  Test Project
    unselect frame

Go to Requirement Specification (titlebar)
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[2]
    unselect frame

Check Requirement Specification (titlebar)
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Navigator - Requirement Specifications
    unselect frame

Go to Test Specification (titlebar)
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[3]
    unselect frame

Check Test Specification (titlebar)
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Navigator - Test Specification
    unselect frame

Go to Test Execution
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[4]
    unselect frame

Check Test Execution
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Execute Tests
    unselect frame

Go to Test Reports
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[5]
    unselect frame

Check Test Reports
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Reports and Metrics
    unselect frame

Go to User Management
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[6]
    unselect frame

Check User Management
    select frame  name=mainframe
    wait until page contains  User Management
    unselect frame

Go to Events
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[7]
    unselect frame

Check Events
    select frame  name=mainframe
    page should contain  Event viewer
    unselect frame

Go to Define Custom Fields
    select frame  name=mainframe
    click link  Define Custom Fields
    unselect frame

Go to Issue Tracker Management
    select frame  name=mainframe
    click link  Issue Tracker Management
    unselect frame

Go to Test Project Management
    select frame  name=mainframe
    click link  Test Project Management
    unselect frame

Go to Assign User Roles
    select frame  name=mainframe
    click link  Assign User Roles
    unselect frame

Go to Assign Custom Fields
    select frame  name=mainframe
    click link  Assign Custom Fields
    unselect frame

Go to Keyword Management
    select frame  name=mainframe
    click link  Keyword Management
    unselect frame

Go to Platform Management
    select frame  name=mainframe
    click link  Platform Management
    unselect frame

Go to Requirement Specification (mainframe)
    select frame  name=mainframe
    click link  Requirement Specification
    unselect frame

Go to Requirement Overview
    select frame  name=mainframe
    click link  Requirement Overview
    unselect frame

Go to Search Requirements
    select frame  name=mainframe
    click link  Search Requirements
    unselect frame

Go to Search Requirement Specifications
    select frame  name=mainframe
    click link  Search Requirement Specifications
    unselect frame

Go to Assign Requirements
    select frame  name=mainframe
    click link  Assign Requirements
    unselect frame

go to Generate Requirement Specification Document
    select frame  name=mainframe
    click link  Generate Requirement Specification Document
    unselect frame

go to Test Specification (mainframe)
    select frame  name=mainframe
    click link  Test Specification
    unselect frame

go to Search Test Cases
    select frame  name=mainframe
    click link  Search Test Cases
    unselect frame

go to Assign Keywords
    select frame  name=mainframe
    click link  Assign Keywords
    unselect frame

go to Test Cases Created Per User
    select frame  name=mainframe
    click link  Test Cases created per User
    unselect frame

Change Test Project
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
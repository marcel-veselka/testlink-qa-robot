*** Settings ***

Documentation  This is the resource file containing all methods based on desktop page
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      chrome
${projectTemplate}  testing project
${newTestProjectName}  testingProjectNew1
${newTestProjectPrefix}  prefixNew1


*** Keywords ***
Go to desired frame
    select frame  mainframe

Click Test Project Management
    click link  Test Project Management

Wait until page contains all elements
    desktopPage.Go to desired frame
    wait until page contains  Test Project Management

Go to Define Custom Fields
    select frame  name=mainframe
    click link  Define Custom Fields
    unselect frame

Check Define Custom Fields
    select frame  name=mainframe
    wait until page contains  Custom fields
    unselect frame

Go to Issue Tracker Management
    select frame  name=mainframe
    click link  Issue Tracker Management
    unselect frame

Check Issue Tracker Management
    select frame  name=mainframe
    wait until page contains  Issue Tracker
    unselect frame

Go to Test Project Management
    select frame  name=mainframe
    click link  Test Project Management
    unselect frame

Check Test Project Management
    select frame  name=mainframe
    wait until page contains  Test Project Management
    unselect frame

Go to Assign User Roles
    select frame  name=mainframe
    click link  Assign User Roles
    unselect frame

Check Assign User Roles
    select frame  name=mainframe
    wait until page contains  User Management
    unselect frame


Go to Assign Custom Fields
    select frame  name=mainframe
    click link  Assign Custom Fields
    unselect frame

Check Assign Custom Fields
    select frame  name=mainframe
    wait until page contains  Assign custom fields
    unselect frame

Go to Keyword Management
    select frame  name=mainframe
    click link  Keyword Management
    unselect frame

Check Keyword Management
    select frame  name=mainframe
    wait until page contains  Keyword Management
    unselect frame

Go to Platform Management
    select frame  name=mainframe
    click link  Platform Management
    unselect frame

Check Platform Management
    select frame  name=mainframe
    wait until page contains  Platform Management
    unselect frame

Go to Requirement Specification (mainframe)
    select frame  name=mainframe
    click link  Requirement Specification
    unselect frame

Check Requirement Specification (mainframe)
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Requirement Specifications
    unselect frame

Go to Requirement Overview
    select frame  name=mainframe
    click link  Requirement Overview
    unselect frame

Check Requirement Overview
    select frame  name=mainframe
    wait until page contains  Requirement Overview
    unselect frame

Go to Search Requirements
    select frame  name=mainframe
    click link  Search Requirements
    unselect frame

Check Search Requirements
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Test Project
    unselect frame

Go to Search Requirement Specifications
    select frame  name=mainframe
    click link  Search Requirement Specifications
    unselect frame

Check Search Requirement Specifications
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains  Search Requirement Specifications
    unselect frame

Go to Assign Requirements
    select frame  name=mainframe
    click link  Assign Requirements
    unselect frame

Check Assign Requirements
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains   Test Specification
    unselect frame

go to Generate Requirement Specification Document
    select frame  name=mainframe
    click link  Generate Requirement Specification Document
    unselect frame

Check Generate Requirement Specification Document
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains   Test Plan
    unselect frame

Go to Test Specification (mainframe)
    select frame  name=mainframe
    click link  Test Specification
    unselect frame

Check Test Specification (mainframe)
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains   Test Specification
    unselect frame

Go to Search Test Cases
    select frame  name=mainframe
    click link  Search Test Cases
    unselect frame

Check Search Test Cases
    select frame  name=mainframe
    wait until page contains   Search Test Cases
    unselect frame

Go to Assign Keywords
    select frame  name=mainframe
    click link  Assign Keywords
    unselect frame

Check Assign Keywords
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains   Test Specification
    unselect frame

Go to Test Cases Created Per User
    select frame  name=mainframe
    click link  Test Cases created per User
    unselect frame

Check Test Cases Created Per User
    select frame  name=mainframe
    wait until page contains   Test Cases created per User
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

Go to Test Plan Management
    select frame  name=mainframe
    click link  Test Plan Management
    unselect frame

Check Test Plan Management
    select frame  name=mainframe
    page should contain  Test Plan Management
    unselect frame

Go to Builds/Releases
    select frame  name=mainframe
    click link  Builds / Releases
    unselect frame

Check Builds/Releases
    select frame  name=mainframe
    page should contain  Build management
    unselect frame

Go to Milestone Overview
    select frame  name=mainframe
    click link  Milestone Overview
    unselect frame
Check Milestone Overview
    select frame  name=mainframe
    page should contain  Milestones for
    unselect frame

Go to Execute Tests
    select frame  name=mainframe
    click link  Execute Tests
    unselect frame

Check Execute Tests
    select frame  name=mainframe
    select frame  name=treeframe
    Current Frame Contains  Execute Tests
    unselect frame

Go to Test Cases Assigned to Me
    select frame  name=mainframe
    click link  Test Cases Assigned to Me
    unselect frame

Check Test Cases Assigned to Me
    select frame  name=mainframe
    page should contain  Test Cases Assigned to User
    unselect frame

Go to Test Reports and Metrics
    select frame  name=mainframe
    click link  Test Reports and Metrics
    unselect frame

Check Test Reports and Metrics
    select frame  name=mainframe
    select frame  name=treeframe
    Current Frame Contains  Reports and Metrics
    unselect frame

Go to Metrics Dashboard
    select frame  name=mainframe
    click link  Metrics Dashboard
    unselect frame

Check Metrics Dashboard
    select frame  name=mainframe
    page should contain  Test Project  :
    unselect frame

Go to Add/Remove Platforms
    select frame  name=mainframe
    click link  Add / Remove Platforms
    unselect frame

Check Add/Remove Platforms
    select frame  name=mainframe
    page should contain  Add / Remove Platforms
    unselect frame

Go to Add/Remove Test Cases
    select frame  name=mainframe
    click link  Add / Remove Test Cases
    unselect frame

Check Add/Remove Test Cases
    select frame  name=mainframe
    select frame  name=treeframe
    Current Frame Contains  Add/Remove Test Cases
    unselect frame

Go to Assign Test Case Execution
    select frame  name=mainframe
    click link  Assign Test Case Execution
    unselect frame

Check Assign Test Case Execution
    select frame  name=mainframe
    select frame  name=treeframe
    Current Frame Contains  Assign Test Case Execution
    unselect frame

Go to Set Urgent Tests
    select frame  name=mainframe
    click link  Set Urgent Tests
    unselect frame

Check Set Urgent Tests
    select frame  name=mainframe
    select frame  name=treeframe
    Current Frame Contains  Set Urgent Tests
    unselect frame

Go to Update Linked Test Case Versions
    select frame  name=mainframe
    click link  Update Linked Test Case Versions
    unselect frame

Check Update Linked Test Case Versions
    select frame  name=mainframe
    select frame  name=treeframe
    Current Frame Contains  Update Linked Test Case Versions
    unselect frame

Go to Show Test Cases Newest Versions
    select frame  name=mainframe
    click link  Show Test Cases Newest Versions
    unselect frame

Check Show Test Cases Newest Versions
    select frame  name=mainframe
    page should contain  Newest versions
    unselect frame

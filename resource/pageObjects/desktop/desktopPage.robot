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
${testSuiteName}                    tsuite77



*** Keywords ***
I am here
    select frame  mainframe
    wait until page contains  System
    wait until page contains  Define Custom Fields
    wait until page contains  Issue Tracker Management
    wait until page contains  Test Project
    wait until page contains  Test Project Management
    wait until page contains  Assign User Roles
    wait until page contains  Assign Custom Fields
    wait until page contains  Keyword Management
    wait until page contains  Platform Management
    wait until page contains  Test Specification
    wait until page contains  Test Cases created per User
    wait until page contains  Test Plan
    wait until page contains  Test Plan Management
    xpath should match x times  //div[@class="vertical_menu"]  2
    unselect frame

I am here in full
    wait until keyword succeeds  1min  0  desktopPage.I am here
    select frame  mainframe
    wait until page contains  Requirement Specification
    wait until page contains  Requirement Overview
    wait until page contains  Search Requirements
    wait until page contains  Search Requirement Specifications
    wait until page contains  Assign Requirements
    wait until page contains  Generate Requirement Specification Document
    unselect frame

Wait until page contains all elements
    select frame  mainframe
    wait until page contains  Test Project Management
    unselect frame

Go to Define Custom Fields
    select frame  name=mainframe
    wait until page contains  Define Custom Fields
    click link  Define Custom Fields
    unselect frame

Check Define Custom Fields
    select frame  name=mainframe
    wait until page contains  Custom fields
    unselect frame

Go to link ${link}
    select frame  name=mainframe
    wait until page contains  ${link}
    click link  ${link}
    unselect frame


Go to Issue Tracker Management
    select frame  name=mainframe
    wait until page contains  Issue Tracker Management
    click link  Issue Tracker Management
    unselect frame

Check Issue Tracker Management
    select frame  name=mainframe
    wait until page contains element  create
    unselect frame

Go to Test Project Management
    select frame  name=mainframe
    wait until page contains element  xpath=//a[text()="Test Project Management"]
    click element  xpath=//a[text()="Test Project Management"]
    unselect frame

Check Test Project Management
    select frame  name=mainframe
    wait until page contains  Test Project Management
    unselect frame

Go to Assign User Roles
    select frame  name=mainframe
    wait until page contains  Assign User Roles
    click link  Assign User Roles
    unselect frame

Check Assign User Roles
    select frame  name=mainframe
    wait until page contains  User Management
    unselect frame

Go to Assign Custom Fields
    select frame  name=mainframe
    wait until page contains  Assign Custom Fields
    click link  Assign Custom Fields
    unselect frame

Check Assign Custom Fields
    select frame  name=mainframe
    wait until page contains  Assign custom fields
    unselect frame

Go to Keyword Management
    select frame  name=mainframe
    wait until page contains  Keyword Management
    click link  Keyword Management
    unselect frame

Check Keyword Management
    select frame  name=mainframe
    wait until page contains  Keyword Management
    unselect frame

Go to Platform Management
    select frame  name=mainframe
    wait until page contains  Platform Management
    click link  Platform Management
    unselect frame

Check Platform Management
    select frame  name=mainframe
    wait until page contains  Platform Management
    unselect frame

Go to Requirement Specification (mainframe)
    select frame  name=mainframe
    wait until page contains  Requirement Specification
    click link  Requirement Specification
    unselect frame

Check Requirement Specification (mainframe)
    select frame  name=mainframe
    select frame  treeframe
    wait until page contains  Requirement Specifications
    unselect frame

Check link ${link}
    select frame  mainframe
    wait until page contains  ${link}
    unselect frame

Go to Requirement Overview
    select frame  name=mainframe
    wait until page contains  Requirement Overview
    click link  Requirement Overview
    unselect frame

Check Requirement Overview
    select frame  name=mainframe
    wait until page contains  Requirement Overview
    unselect frame

Go to Search Requirements
    select frame  name=mainframe
    wait until page contains  Search Requirements
    click link  Search Requirements
    unselect frame

Check Search Requirements
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains  Test Project
    unselect frame

Go to Search Requirement Specifications
    select frame  name=mainframe
    wait until page contains  Search Requirement Specifications
    click link  Search Requirement Specifications
    unselect frame

Check Search Requirement Specifications
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains  Search Requirement Specifications
    unselect frame

Go to Assign Requirements
    select frame  name=mainframe
    wait until page contains  Assign Requirements
    click link  Assign Requirements
    unselect frame

Check Assign Requirements
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains   Test Specification
    unselect frame

go to Generate Requirement Specification Document
    select frame  name=mainframe
    wait until page contains  Generate Requirement Specification Document
    click link  Generate Requirement Specification Document
    unselect frame

Check Generate Requirement Specification Document
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains   Test Plan
    unselect frame

Go to Test Specification (mainframe)
    select frame  name=mainframe
    wait until page contains  Test Specification
    click link  Test Specification
    unselect frame

Check Test Specification (mainframe)
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains   Test Specification
    unselect frame

Go to Search Test Cases
    select frame  name=mainframe
    wait until page contains  Search Test Cases
    click link  Search Test Cases
    unselect frame

Check Search Test Cases
    select frame  name=mainframe
    wait until page contains   Search Test Cases
    unselect frame

Go to Assign Keywords
    select frame  name=mainframe
    wait until page contains  Assign Keywords
    click link  Assign Keywords
    unselect frame

Check Assign Keywords
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains   Test Specification
    unselect frame

Go to Test Cases Created Per User
    select frame  name=mainframe
    wait until page contains  Test Cases created per User
    click link  Test Cases created per User
    unselect frame

Check Test Cases Created Per User
    select frame  name=mainframe
    wait until page contains   Test Cases created per User
    unselect frame

Check Current Project
    select frame  name=mainframe
    wait until page contains  Execute Tests
    unselect frame

Check Selected Project and Requirement link
    desktopPage.Check link Requirement Specification


Check info
    select frame  name=mainframe
    click element  xpath=/html/body/div[1]/div[1]/img
    wait until page contains element  tlhelp
    unselect frame

Go to Test Plan Management
    select frame  name=mainframe
    wait until page contains  Test Plan Management
    click link  Test Plan Management
    unselect frame

Check Test Plan Management
    select frame  name=mainframe
    wait until page contains  Test Plan Management
    unselect frame

Go to Builds/Releases
    select frame  name=mainframe
    wait until page contains element  xpath=//a[text()="Builds / Releases"]
    click link  Builds / Releases
    unselect frame

Check Builds/Releases
    select frame  name=mainframe
    wait until page contains  Build management
    unselect frame

Go to Milestone Overview
    select frame  name=mainframe
    wait until page contains  Milestone Overview
    click link  Milestone Overview
    unselect frame

Check Milestone Overview
    select frame  name=mainframe
    wait until page contains  Milestones for
    unselect frame

Go to Execute Tests
    select frame  name=mainframe
    wait until page contains  Execute Tests
    click link  Execute Tests
    unselect frame

Check Execute Tests
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains  Execute Tests
    unselect frame

Go to Test Cases Assigned to Me
    select frame  name=mainframe
    wait until page contains  Test Cases Assigned to Me
    click link  Test Cases Assigned to Me
    unselect frame

Check Test Cases Assigned to Me
    select frame  name=mainframe
    wait until page contains  Test Cases Assigned to User
    unselect frame

Go to Test Reports and Metrics
    select frame  name=mainframe
    wait until page contains  Test Reports and Metrics
    click link  Test Reports and Metrics
    unselect frame

Check Test Reports and Metrics
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains  Reports and Metrics
    unselect frame

Go to Metrics Dashboard
    select frame  name=mainframe
    wait until page contains  Metrics Dashboard
    click link  Metrics Dashboard
    unselect frame

Check Metrics Dashboard
    select frame  name=mainframe
    wait until page contains  Test Project
    unselect frame

Go to Add/Remove Platforms
    select frame  name=mainframe
    wait until page contains  Add / Remove Platforms
    click link  Add / Remove Platforms
    unselect frame

Check Add/Remove Platforms
    select frame  name=mainframe
    wait until page contains  Add / Remove Platforms
    unselect frame

Go to Add/Remove Test Cases
    select frame  name=mainframe
    wait until page contains  Add / Remove Test Cases
    click link  Add / Remove Test Cases
    unselect frame

Check Add/Remove Test Cases
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains  Add/Remove Test Cases
    unselect frame

Go to Assign Test Case Execution
    select frame  name=mainframe
    wait until page contains  Assign Test Case Execution
    click link  Assign Test Case Execution
    unselect frame

Check Assign Test Case Execution
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains  Assign Test Case Execution
    unselect frame

Go to Set Urgent Tests
    select frame  name=mainframe
    #select frame  name=workframe
    wait until page contains element  xpath=//*[@id="testplan_contents_topics"]/a[2]
    page should contain element  xpath=//*[@id="testplan_contents_topics"]/a[2]
    click link  xpath=//*[@id="testplan_contents_topics"]/a[2]
    unselect frame


Go to click and Set Urgent Tests
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="testplan_contents_topics"]/a[4]
    page should contain element  xpath=//*[@id="testplan_contents_topics"]/a[4]
    click link  xpath=//*[@id="testplan_contents_topics"]/a[4]
    unselect frame

Go to click and Set UT
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="testplan_contents_topics"]/a[4]
    page should contain element  xpath=//*[@id="testplan_contents_topics"]/a[4]
    click link  xpath=//*[@id="testplan_contents_topics"]/a[4]
    unselect frame

Click On Test Suite
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//span[text()="${testSuiteName} (1)" ]
    click element  xpath=//span[text()="${testSuiteName} (1)" ]
    unselect frame

check if Checkbox high is selected
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    checkbox should be selected  xpath=//*[@id="set_urgency_tc"]/table/tbody/tr[2]/td[4]/input
    #click element  xpath=//td[4]/input/@value["3"]
    unselect frame

Check Set Urgent Tests
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains  Set Urgent Tests
    unselect frame

Go to Update Linked Test Case Versions
    select frame  name=mainframe
    wait until page contains  Update Linked Test Case Versions
    click link  Update Linked Test Case Versions
    unselect frame

Check Update Linked Test Case Versions
    select frame  name=mainframe
    wait until page contains element  treeframe
    select frame  name=treeframe
    wait until page contains  Update Linked Test Case Versions
    unselect frame

Go to Show Test Cases Newest Versions
    select frame  name=mainframe
    wait until page contains  Show Test Cases Newest Versions
    click link  Show Test Cases Newest Versions
    unselect frame

Check Show Test Cases Newest Versions
    select frame  name=mainframe
    wait until page contains  Newest versions
    unselect frame

Go and check high
    select frame  name=mainframe
    wait until page contains element  name=workframe
    select frame  name=workframe
    wait until page contains element  name=high_urgency
    #page should contain element  name=high_urgency
    click element  high_urgency
    wait until page contains element  xpath=//*[@id="set_urgency_tc"]/div/input
    click element  xpath=//*[@id="set_urgency_tc"]/div/input
    unselect frame
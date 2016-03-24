*** Settings ***

Documentation  This is the resource file containing all methods based part of desktop which contains header
Library        Selenium2Library



*** Variables ***
${searchedTestCase}  4
${newTestProjectPrefix}  prefixNew1
${newTestProjectName}  tp:testing project

*** Keywords ***

Check header is there  #pro ucely debugovani
    page should contain element  xpath=//frame[@name="titlebar"]

Wait untill header is loaded
    select frame  name=titlebar
    sleep  1
    wait until page contains element  xpath=//img[@alt="Company logo"]
    wait until page contains element  xpath=//img[@title="My Settings"]
    wait until page contains element  xpath=//img[@title="Logout"]
    wait until page contains element  xpath=//img[@title="Project"]
    wait until page contains element  xpath=//img[@title="Requirement Specification"]
    wait until page contains element  xpath=//img[@title="Test Specification"]
    wait until page contains element  xpath=//img[@title="Test Execution"]
    wait until page contains element  xpath=//img[@title="Test Reports"]
    wait until page contains element  xpath=//img[@title="User Management"]
    wait until page contains element  xpath=//img[@title="Events"]
    wait until page contains element  name=targetTestCase
    wait until page contains element  xpath=//img[@title="Search Test Case by ID"]
    wait until page contains element  xpath=//select[@name="testproject"]
    unselect frame

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

Go to Test Reports
    select frame  name=titlebar
    click element  xpath=/html/body/div[3]/a[5]
    unselect frame

Check Test Reports
    select frame  name=mainframe
    select frame  name=treeframe
    Current Frame Contains  Reports and Metrics
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

Input text into test case search
    input text  targetTestCase  ${searchedTestCase}

Start searching test case
    click element  xpath=//img[@title="Search Test Case by ID"]

Click test project dropdown
    select frame  name=titlebar
    click element  xpath=//select[@name="testproject"]
    unselect frame


Choose test project from dropdown
    select frame  name=titlebar
    select from list by label  xpath=//select[@name="testproject"]  ${newTestProjectPrefix}:${newTestProjectName}
    unselect frame


Change Test Project
    select frame  name=titlebar
    select from list  testproject  1
    unselect frame
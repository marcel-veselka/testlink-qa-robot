*** Settings ***

Documentation  This is the resource file containing all methods based part of desktop which contains header
Library        Selenium2Library



*** Variables ***

*** Keywords ***
I am here
    select frame  name=titlebar
    wait until page contains element  xpath=//img[@alt="Company logo"]
    wait until page contains element  xpath=//img[@title="My Settings"]
    wait until page contains element  xpath=//img[@title="Logout"]
    wait until page contains element  xpath=//img[@title="Project"]
    wait until page contains element  xpath=//img[@title="Test Specification"]
    wait until page contains element  xpath=//img[@title="User Management"]
    wait until page contains element  xpath=//img[@title="Events"]
    wait until page contains element  name=targetTestCase
    wait until page contains element  xpath=//img[@title="Search Test Case by ID"]
    wait until page contains element  xpath=//select[@name="testproject"]
    unselect frame

I am here in full
    headerPage.I am here
    select frame  name=titlebar
    wait until page contains element  xpath=//img[@title="Requirement Specification"]
    wait until page contains element  xpath=//img[@title="Test Execution"]
    wait until page contains element  xpath=//img[@title="Test Reports"]
    unselect frame

Go to index page
    headerPage.I am here
    select frame  name=titlebar
    click element  xpath=//img[@title="logo"]
    unselect frame

Go to index page and change testproject
    select frame  name=titlebar
    wait until page contains element  xpath=//img[@alt="Company logo"]
    click element  xpath=//img[@alt="Company logo"]
    unselect frame
    select frame  name=titlebar
    wait until page contains element  testproject
    select from list by label  xpath=//select[@name="testproject"]  ${newTestProjectPrefix}:${newTestProjectName}
    unselect frame

Go to My Settings
    headerPage.I am here
    select frame  name=titlebar
    click element  xpath=//a[img[@title="My Settings"]]
    unselect frame

Go to Desktop (Project)
    headerPage.I am here
    select frame  name=titlebar
    click element  xpath=//img[@title="Project"]
    unselect frame

Go to Requirement Specification (titlebar)
    headerPage.I am here in full
    select frame  name=titlebar
    click element  xpath=//img[@title="Requirement Specification"]
    unselect frame


Go to Test Specification (titlebar)
    headerPage.I am here
    select frame  name=titlebar
    click element  xpath=//img[@title="Test Specification"]
    unselect frame

Go to Test Execution
    headerPage.I am here in full
    select frame  name=titlebar
    click element  xpath=//img[@title="Test Execution"]
    unselect frame

Go to Test Reports
    headerPage.I am here in full
    select frame  name=titlebar
    click element  xpath=//img[@title="Test Reports"]
    unselect frame

Go to User Management
    headerPage.I am here
    select frame  name=titlebar
    click element  xpath=//img[@title="User Management"]
    unselect frame

Go to Events
    headerPage.I am here
    select frame  name=titlebar
    click element  xpath=//img[@title="Events"]
    unselect frame

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
    wait until page contains element  xpath=//select[@name="testproject"]
    select from list by label  xpath=//select[@name="testproject"]  tp:testing project
    unselect frame
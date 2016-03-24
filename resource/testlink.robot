*** Settings ***
Library  Selenium2Library
Resource  ../resource/pageObjects/loginPage.robot
Resource  ../resource/pageObjects/desktop/desktopPage.robot
Resource  ../resource/pageObjects/desktop/headerPage.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/assignRequirements.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/generateRequirementSpecificationDocument.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/requirementOverview.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/requirementSpecification(mainframe).robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/searchRequirements.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/searchRequirementSpecifications.robot
Resource  ../resource/pageObjects/desktop/system/defineCustomFields.robot
Resource  ../resource/pageObjects/desktop/system/issueTrackerManagement.robot
Resource  ../resource/pageObjects/desktop/testProject/assignCustomFields.robot
Resource  ../resource/pageObjects/desktop/testProject/assignUserRoles.robot
Resource  ../resource/pageObjects/desktop/testProject/keywordManagement.robot
Resource  ../resource/pageObjects/desktop/testProject/platformManagement.robot
Resource  ../resource/pageObjects/desktop/testProject/testProjectManagement.robot
Resource  ../resource/pageObjects/desktop/testSpecification/assignKeywords.robot
Resource  ../resource/pageObjects/desktop/testSpecification/searchTestCases.robot
Resource  ../resource/pageObjects/desktop/testSpecification/testCasesCreatedPerUser.robot
Resource  ../resource/pageObjects/desktop/testSpecification/testSpecification(mainframe).robot
Resource  ../resource/pageObjects/desktop/testProject/createTestProjectPage.robot
Resource  ../resource/pageObjects/desktop/testProject/testProjectEdit.robot

*** Variables ***


*** Keywords ***

Login as admin correct
    loginPage.Open Browser To Login Page
    loginPage.Wait until page contains all elements for login
    loginPage.Fill correct credentials and submit
    loginPage.Check there is no warning about login



Login as admin incorrect
    loginPage.Open Browser To Login Page
    loginPage.Wait until page contains all elements for login
    loginPage.Fill incorrect credentials and submit
    loginPage.Check there is a warning about login
    loginPage.Close the browser

Check desktop links
    desktopPage.Go to Define Custom Fields
    desktopPage.Check Define Custom Fields
    headerPage.Go to index page
    desktopPage.Go to Issue Tracker Management
    desktopPage.Check Issue Tracker Management
    headerPage.Go to index page
    desktopPage.Go to Test Project Management
    desktopPage.Check Test Project Management
    headerPage.Go to index page
    desktopPage.Go to Assign User Roles
    desktopPage.Check Assign User Roles
    headerPage.Go to index page
    desktopPage.Go to Assign Custom Fields
    desktopPage.Check Assign Custom Fields
    headerPage.Go to index page
    desktopPage.Go to Keyword Management
    desktopPage.Check Keyword Management
    headerPage.Go to index page
    desktopPage.Go to Platform Management
    desktopPage.Check Platform Management
    headerPage.Go to index page
    desktopPage.Go to Requirement Specification (mainframe)
    desktopPage.Check Requirement Specification (mainframe)
    headerPage.Go to index page
    desktopPage.Go to Requirement Overview
    desktopPage.Check Requirement Overview
    headerPage.Go to index page
    desktopPage.Go to Search Requirements
    desktopPage.Check Search Requirements
    headerPage.Go to index page
    desktopPage.Go to Search Requirement Specifications
    desktopPage.Check Search Requirement Specifications
    headerPage.Go to index page
    desktopPage.Go to Assign Requirements
    desktopPage.Check Assign Requirements
    headerPage.Go to index page
    desktopPage.go to Generate Requirement Specification Document
    desktopPage.Check Generate Requirement Specification Document
    headerPage.Go to index page
    desktopPage.Go to Test Specification (mainframe)
    desktopPage.Check Test Specification (mainframe)
    headerPage.Go to index page
    desktopPage.Go to Search Test Cases
    desktopPage.Check Search Test Cases
    headerPage.Go to index page
    desktopPage.Go to Assign Keywords
    desktopPage.Check Assign Keywords
    headerPage.Go to index page
    desktopPage.Go to Test Cases Created Per User
    desktopPage.Check Test Cases Created Per User
    headerPage.Go to index page
    desktopPage.Go to Test Plan Management
    desktopPage.Check Test Plan Management
    headerPage.Go to index page
    desktopPage.Go to Builds/Releases
    desktopPage.Check Builds/Releases
    headerPage.Go to index page
    desktopPage.Go to Milestone Overview
    desktopPage.Check Milestone Overview
    headerPage.Go to index page
    desktopPage.Go to Execute Tests
    desktopPage.Check Execute Tests
    headerPage.Go to index page
    desktopPage.Go to Test Cases Assigned to Me
    desktopPage.Check Test Cases Assigned to Me
    headerPage.Go to index page
    desktopPage.Go to Test Reports and Metrics
    desktopPage.Check Test Reports and Metrics
    headerPage.Go to index page
    desktopPage.Go to Metrics Dashboard
    desktopPage.Check Metrics Dashboard
    headerPage.Go to index page
    desktopPage.Go to Add/Remove Platforms
    desktopPage.Check Add/Remove Platforms
    headerPage.Go to index page
    desktopPage.Go to Add/Remove Test Cases
    desktopPage.Check Add/Remove Test Cases
    headerPage.Go to index page
    desktopPage.Go to Assign Test Case Execution
    desktopPage.Check Assign Test Case Execution
    headerPage.Go to index page
    desktopPage.Go to Set Urgent Tests
    desktopPage.Check Set Urgent Tests
    headerPage.Go to index page
    desktopPage.Go to Update Linked Test Case Versions
    desktopPage.Check Update Linked Test Case Versions
    headerPage.Go to index page
    desktopPage.Go to Show Test Cases Newest Versions
    desktopPage.Check Show Test Cases Newest Versions
    headerPage.Go to index page

Check header links
    headerPage.Change Test Project
    headerPage.Wait untill header is loaded
    headerPage.Go to My Settings
    headerPage.Check My Settings
    headerPage.Go to Desktop (Project)
    headerPage.Check Desktop (Project)
    headerPage.Go to Requirement Specification (titlebar)
    headerPage.Check Requirement Specification (titlebar)
    headerPage.Go to Test Specification (titlebar)
    headerPage.Check Test Specification (titlebar)
    headerPage.Go to Test Execution
    headerPage.Go to Test Reports
    headerPage.Check Test Reports
    headerPage.Go to User Management
    headerPage.Check User Management
    headerPage.Go to Events
    headerPage.Check Events
    headerPage.Go to index page

Start creating new test project
    desktopPage.Go to Test Project Management
    testProjectManagement.Check Test Project Management
    testProjectManagement.Click Create

Start creating new test project (enchanced features)
    desktopPage.Go to Test Project Management
    testProjectManagement.Check Test Project Management
    testProjectManagement.Click Create

Fill information to create test (enchanced feautures)
    createTestProjectPage.Wait until page contains all elements
    select frame  mainframe
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}
    createTestProjectPage.Select Create From Existing Projects = No
    createTestProjectPage.Unselect all features
    unselect frame

Start creating new test project without conflict
    desktopPage.Go to Test Project Management
    Check unique test project name and prefix
    testProjectManagement.Click Create

Fill information to create test without conflict
    createTestProjectPage.Wait until page contains all elements
    select frame  mainframe
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}
    unselect frame

No warning about existing projects
    createTestProjectPage.Warning message is not here

Fill information to create test with template OFF
    createTestProjectPage.Wait until page contains all elements
    select frame  mainframe
    createTestProjectPage.Choose no template
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix}
    unselect frame


Fill information to create test with template ON
    createTestProjectPage.Wait until page contains all elements
    select frame  mainframe
    createTestProjectPage.Choose template from created project
    createTestProjectPage.Fill Test Project Name  ${newTestProjectName2}
    createTestProjectPage.Fill Test Project Prefix  ${newTestProjectPrefix2}
    unselect frame


Submit and check new test project
    createTestProjectPage.Click Create
    No warning about existing projects
    testProjectManagement.Check new project exists

Check unique test project name and prefix

    testProjectManagement.Check Test Project Management
    select frame  mainframe
    element should not contain  item_view_wrapper  ${newTestProjectName}
    element should not contain  item_view_wrapper  ${newTestProjectPrefix}
    unselect frame

Delete test project
   # [Arguments]  ${newTestProjectName}  ${newTestProjectPrefix}
    testProjectManagement.Check Test Project Management
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    wait until page does not contain element  ${newTestProjectName}
    wait until page does not contain element  ${newTestProjectPrefix}
    unselect frame

Create new Test Project
    Login as admin correct
    Start creating new test project without conflict
    Fill information to create test without conflict
    Submit and check new test project

Go to Test Project Management
    desktopPage.Go to Test Project Management

Click desired project
    testProjectManagement.Wait until container with projects is here
    testProjectManagement.Click desired project

Unselect Checkbox Availibility Active
    testProjectEdit.Unselect Checkbox Availibility Active


Check Test Project Is Inactive
    testProjectManagement.Check Test Project Is Inactive






*** Settings ***
Library  Selenium2Library
Resource  ../resource/pageObjects/loginPage.robot
Resource  ../resource/pageObjects/desktop/desktopPage.robot
Resource  ../resource/pageObjects/desktop/headerPage.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/assignRequirements.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/requirementSpecificationEdit.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/assignRequirementsNavigator.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/generateRequirementSpecificationDocument.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/requirementOverview.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/requirementSpecification(mainframe).robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/searchRequirements.robot
Resource  ../resource/pageObjects/desktop/requirementSpecification/searchRequirementSpecifications.robot
Resource  ../resource/pageObjects/desktop/system/defineCustomFields.robot
Resource  ../resource/pageObjects/desktop/system/issueTrackerManagement.robot
Resource  ../resource/pageObjects/desktop/system/editIssueTracker.robot
Resource  ../resource/pageObjects/desktop/testProject/assignCustomFields.robot
Resource  ../resource/pageObjects/desktop/testProject/assignUserRoles.robot
Resource  ../resource/pageObjects/desktop/testProject/keywordManagement.robot
Resource  ../resource/pageObjects/desktop/testProject/platformManagement.robot
Resource  ../resource/pageObjects/desktop/testProject/testProjectManagement.robot
Resource  ../resource/pageObjects/desktop/testSpecification/assignKeywords.robot
Resource  ../resource/pageObjects/desktop/testSpecification/searchTestCases.robot
Resource  ../resource/pageObjects/desktop/testSpecification/testCasesCreatedPerUser.robot
Resource  ../resource/pageObjects/desktop/testSpecification/testSpecification(mainframe).robot
Resource  ../resource/pageObjects/desktop/testSpecification/navigatorTestSpecification.robot
Resource  ../resource/pageObjects/desktop/testProject/createTestProjectPage.robot
Resource  ../resource/pageObjects/desktop/testProject/testProjectEdit.robot
Resource  ../resource/pageObjects/desktop/userManagement/userManagement.robot
Resource  ../resource/pageObjects/desktop/TestPlan/testPlanManagement.robot
Resource  ../resource/pageObjects/desktop/TestPlan/testPlanManagement_detail.robot
Resource  ../resource/pageObjects/desktop/mySettings/mySettings.robot
Resource  ../resource/pageObjects/desktop/buildsReleases/buildsReleases.robot


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

Login as admin with empty password field
    loginPage.Open Browser To Login Page
    loginPage.Wait until page contains all elements for login
    loginPage.Fill correct Login input
    loginPage.Check that warning about empty field appears


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
   [Arguments]  ${newTestProjectName}  ${newTestProjectPrefix}
    headerPage.Go to index page
    desktopPage.Wait until page contains all elements
    desktopPage.Go to Test Project Management
    testProjectManagement.Check Test Project Management
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    wait until page does not contain element  ${newTestProjectName}
    wait until page does not contain element  ${newTestProjectPrefix}
    unselect frame

Delete empty test project

    testProjectManagement.Check Test Project Management
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame

Check that test has been deleted
    select frame  mainframe
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

Start creating new user
    [Tags]  tp-100_Create_New_User
    headerPage.Change Test Project
    headerPage.Wait untill header is loaded
    headerPage.Go to User Management
    headerPage.Check User Management
    userManagement.Wait until page contains view users content
    userManagement.Click create button

Fill all info about user and submit
    [Tags]  tp-100_Create_New_User
    userManagement.Check all fields for new user are availiable
    userManagement.Fill inputs for creating user and submit

Check that user exists
    [Tags]  tp-100_Create_New_User
    userManagement.Check that user exists



Click test project dropdown
    headerPage.Click test project dropdown

Choose test project from dropdown
    headerPage.Choose test project from dropdown

Go to Platform Management
    desktopPage.Go to Platform Management

Check Platform Management Without Platforms
    platformManagement.Check Platform Management Without Platforms

Unactive Test Project by Bulb
    [Tags]  tp13

    testProjectManagement.Unactive Test Project by Bulb

Check Test Project Is Active
    [Tags]  tp13

    testProjectManagement.Check Test Project Is Active

Go to index page
    headerPage.Go to index page

Go to Requirement Specification (mainframe)
    [Tags]  tp38
    desktopPage.Go to Requirement Specification (mainframe)

Create New Requirement Specification (type URS)
    [Tags]  tp38
    requirementSpecificationEdit.Create New Requirement Specification (type URS)

Change Test Project
    [Tags]  tp38  tp5
    headerPage.Change Test Project
    desktopPage.Check New Project

Choose Requirement Specification
    [Tags]  tp38
    requirementSpecificationEdit.Choose Requirement Specification

Create Requirement Operations
    [Tags]  tp38
    requirementSpecificationEdit.Create Requirement Operations


Delete Requirement Specification
    [Tags]  tp38
    headerPage.Go to index page
    desktopPage.Go to Requirement Specification (mainframe)
    requirementSpecificationEdit.Delete Requirement Specification

Change and check test project
    [Tags]  tp5
    headerPage.Change Test Project
    desktopPage.Check New Project

Change and check test project with RS control
    [Tags]  tp38
    headerPage.Change Test Project
    desktopPage.Check Selected Project and Requirement link


Start creating Define Custom Fields
    [Tags]  tp105
    desktopPage.Go to Define Custom Fields
    defineCustomFields.Check Define Custom Fields
    defineCustomFields.Click create Custom Field

Go to Define Custom Fields
    [Tags]  tp106
    defineCustomFields.Check Define Custom Fields

Edit information Custom Field
    defineCustomFields.Select Custom Field
    defineCustomFields.Edit Custom Fields

Fill information to create Custom Field
    [Tags]  tp105
    defineCustomFields.Input information about Custom Field


Submit and check Define Custom Field
    [Tags]  tp105
    defineCustomFields.Create and check custom field

Submit and check Edited Define Custom Field
    [Tags]  tp106
   defineCustomFields.Check edited custom field

Delete Custom Field
    [Tags]  tp105
    headerPage.Go to index page
    desktopPage.Go to Define Custom Fields
    defineCustomFields.Select and delete Custom Field
    defineCustomFields.Check if Custom Field has been deleted

Delete EDITED Custom Field
    [Tags]  tp106
    headerPage.Go to index page
    desktopPage.Go to Define Custom Fields
    defineCustomFields.Select and delete EDITED Custom Field
    defineCustomFields.Check if EDITED Custom Field has been deleted

Start editing user
    [Tags]  tp-101_Modify_user
    headerPage.Change Test Project
    headerPage.Wait untill header is loaded
    headerPage.Go to User Management
    headerPage.Check User Management
    userManagement.Wait until page contains view users content
    userManagement.Click desired user

Click desired user
    [Tags]  tp-101_Modify_user
    userManagement.Click desired user

Edit user
    [Tags]  tp-101_Modify_user
    userManagement.Check all fields for editing user are availiable
    userManagement.Fill inputs for editing user and submit

Create New Test Plan Management
    [Tags]  tp53_Create_test_plan_no_conflict  tp_61

    desktopPage.Wait until page contains all elements
    desktopPage.Go to Test Plan Management
    desktopPage.Check Test Plan Management
    testPlanManagement.Create Test Plan Management
    testPlanManagement_detail.Input Name  ${TestPlanManagementName}
    testPlanManagement_detail.Input Description
    testPlanManagement_detail.Select Checkbox Active
    testPlanManagement_detail.Select Checkbox Public
    testPlanManagement_detail.Click Create button to finish Test Plan Management
    testPlanManagement.Check Test Plan Management is Created  ${TestPlanManagementName}
    capture page screenshot

Create Test Plan Management AS COPY
     [Tags]  tp54

    desktopPage.Wait until page contains all elements
    desktopPage.Go to Test Plan Management
    desktopPage.Check Test Plan Management
    testPlanManagement.Create Test Plan Management
    testPlanManagement_detail.Input Name  ${TestPlanManagementName2}
    testPlanManagement_detail.Create from existing Test Plan?
    testPlanManagement_detail.Click Create button to finish Test Plan Management
    testPlanManagement.Check Test Plan Management is Created  ${TestPlanManagementName2}

Click on Test Plan Management
    [Tags]  tp55

    desktopPage.Wait until page contains all elements
    desktopPage.Go to Test Plan Management
    desktopPage.Check Test Plan Management
    #testPlanManagement_detail.Click Create button to finish Test Plan Management

Create Test Plan Management AS COPY NOK
    [Tags]  tp55

    testPlanManagement.Create Test Plan Management
    testPlanManagement_detail.Input Name  ${TestPlanManagementName}
    testPlanManagement_detail.Click Create button to finish Test Plan Management
    testPlanManagement_detail.Warning Message Creating Same Test Plan Management

Create Test Plan Management AS COPY Unselect all checkboxes
    [Tags]  tp55

    testPlanManagement_detail.Input Name  ${TestPlanManagementName2}
    testPlanManagement_detail.Create from existing Test Plan?
    wait until page contains all checkboxes from existing Test Plan
    testPlanManagement_detail.unselect checkbox Copy User Roles
    testPlanManagement_detail.unselect checkbox Copy Attachements
    testPlanManagement_detail.unselect checkbox Copy Test Cases
    testPlanManagement_detail.unselect checkbox Copy Builds
    testPlanManagement_detail.unselect checkbox Copy Platforms Links
    testPlanManagement_detail.unselect checkbox Copy Milestones
    testPlanManagement_detail.unselect checkbox Active
    testPlanManagement_detail.unselect checkbox Public
    testPlanManagement_detail.Click Create button to finish Test Plan Management
    testPlanManagement.Check Test Plan Management is Created  ${TestPlanManagementName2}





Delete Test Plan Management
        [Arguments]  ${TestPlanManagementNameToDelete}

     headerPage.Go to index page
     desktopPage.Go to Test Plan Management
     desktopPage.Check Test Plan Management
     testPlanManagement_detail.Click Button Delete Test Plan Management  ${TestPlanManagementNameToDelete}
     testPlanManagement_detail.Confirm Delete Test Plan Management
     testPlanManagement_detail.Check Test Plan Management Deleted  ${TestPlanManagementNameToDelete}


Edit Requirement Operations
    [Tags]  tp40_modify_requirement
    requirementSpecificationEdit.Edit Requirement Operations
    requirementSpecificationEdit.Check Edited Requirement Operations

Create Test Case From Requirement
    [Tags]  tp41_requirement_operation_creare_tc
    requirementSpecificationEdit.Create Test Case From Requirement

Check Test Specification
    [Tags]  tp41_requirement_operation_creare_tc
    desktopPage.Go to Test Specification (mainframe)
    navigatorTestSpecification.Add Filters Test Case Title Test Specification

Delete Test Case
    [Tags]  tp41_requirement_operation_creare_tc
    headerPage.Go to index page
    desktopPage.Go to Test Specification (mainframe)
    navigatorTestSpecification.Delete Test Case


Go to Test Specification (mainframe)
    [Tags]  tp41_requirement_operation_creare_tc
    desktopPage.Go to Test Specification (mainframe)


Start Creating Issue Tracker Management
    [Tags]  tp107
    desktopPage.Go to Issue Tracker Management
    issueTrackerManagement.Check Issue Tracker Management
    issueTrackerManagement.Click Create Issue Tracker Management

Fill in all the fields, types and finish creating
    [Tags]  tp107
    issueTrackerManagement.Fill in all fields, type: BUGZILLA (XMLRPC)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: BUGZILLA (DB)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: MANTIS (SOAP)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: MANTIS (DB)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: JIRA (SOAP)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: JIRA (DB)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: JIRA (REST)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: FOGBUGZ (DB)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: FOGBUGZ (REST)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: YOUTRACK (REST)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: REDMINE (REST)
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: TRAC (XMLRPC)

Check issue trackers have been created
    issueTrackerManagement.Check created issue trackers

Delete all created issue trackers
    issueTrackerManagement.Delete Issue trackers

Get to Issue Tracker Management
    [Tags]  tp108
    desktopPage.Go to link Issue Tracker Management
    issueTrackerManagement.Check Issue Tracker Management

Create Issue Tracker
    [Tags]  tp108
    testlink.Login as admin correct
    testlink.Get to Issue Tracker Management
    issueTrackerManagement.Click Create Issue Tracker Management
    issueTrackerManagement.Fill in all fields, type: BUGZILLA (XMLRPC)
    issueTrackerManagement.Check Issue Tracker named ${ISSUETRACKER}
    headerPage.Go to index page

Click created Issue Tracker with name ${ISSUETRACKER}
    [Tags]  tp108
    select frame  mainframe
    wait until page contains element  xpath=//a[contains(text(),"${ISSUETRACKER}")]
    click element  xpath=//a[contains(text(),"${ISSUETRACKER}")]
    unselect frame

Modify name and type of Issue Tracker
    [Tags]  tp108
    editIssueTracker.Modify name and type of Issue Tracker newIssueTracker
    issueTrackerManagement.Check Issue Tracker named newIssueTracker
    testlink.Click created Issue Tracker with name newIssueTracker
    editIssueTracker.Modify name and type of Issue Tracker ${ISSUETRACKER}
    issueTrackerManagement.Check Issue Tracker named ${ISSUETRACKER}

Delete Issue Tracker ${ISSUETRACKER}
    [Tags]  tp108
    headerPage.Go to index page
    Get to Issue Tracker Management
    issueTrackerManagement.Delete Issue tracker ${ISSUETRACKER}

Validate settings fields
    [Tags]  tp96
    desktopPage.Wait until page contains all elements
    headerPage.Go to My Settings
    headerPage.Check My Settings
    mySettings.Check Page
    mySettings.Email Adress Empty
    mySettings.Check Email field must be filled
    mySettings.First Name Empty
    mySettings.Check First Name field must be filled
    mySettings.Last Name Empty
    mySettings.Check Last Name field must be filled

Input Personal data in settings
    [Tags]  tp96

    mySettings.input First Name
    mySettings.input Last Name
    mySettings.input Email Adress
    mySettings.click Save Button

Change Personal password in My Settings
    [Tags]  tp96

    mySettings.Change Password

Set Personal password in My Settings back
    [Tags]  tp96

    mySettings.Change Password back

Set Personal data in My Settings back
    [Tags]  tp96

    mySettings.Set Personal data back to normal


Add Issue Tracker to test project
    [Tags]  tp14
    testProjectManagement.Check Test Project Management
    testProjectManagement.Click desired project
    testProjectManagement.Add issue tracker to test project

Save test project and check Issue Tracker has been added
    [Tags]  tp14
    testProjectManagement.Create Test Project
    testProjectManagement.Check Issue Tracker has been added to the Test Project

Delete Issue Tracker from test Project
    headerPage.Go to index page
    desktopPage.Go to link Test Project Management
    testProjectManagement.Click desired project
    testProjectManagement.Remove issue tracker from test project
    testProjectManagement.Create Test Project

Create New Version Of Requirement
    [Tags]  tp44
    requirementSpecificationEdit.Create New Version Of Requirement

Delete Requirement Specification NO
    [Tags]  tp44
    requirementSpecificationEdit.Delete Requirement Specification NO

Select More Than 1 Version Requirement
    [Tags]  tp44
    requirementSpecificationEdit.Select More Than 1 Version Requirement

Delete More Than 1 Version Requirement
    [Tags]  tp44
    requirementSpecificationEdit.Delete More Than 1 Version Requirement

Check Requirement Version
    [Tags]  tp44
    requirementSpecificationEdit.Check Requirement Version

Go to Assign Requirements
    [Tags]  tp47
    desktopPage.Go to Assign Requirements

Select Test Suite
    [Tags]  tp47
    assignRequirementsNavigator.Select Test Suite

Assign Requirements
    [Tags]  tp47
    assignRequirementsNavigator.Assign Requirements

Check Assign Requirements
    [Tags]  tp47
    assignRequirementsNavigator.Check Assign Requirements

Start creating build
    [Tags]  tp61

    desktopPage.Go to Builds/Releases
    buildsReleases.Check Builds/Releases
    buildsReleases.Create Build
    buildsReleases.Check if warning message appears

Add Details and Finish creating build
    [Tags]  tp61
    buildsReleases.Fill in the details of the Build
    buildsReleases.Save Build

Create Build With Release Date And Save
    [Tags]  tp62
    buildsReleases.Fill in the details of the Build
    buildsReleases.Fill In Future Release Date
    buildsReleases.Save Build

Check that Build is created
    [Tags]  tp61
    buildsReleases.Check if Build was created

Delete Build
    [Tags]  tp61

    headerPage.Go to index page
    desktopPage.Go to Builds/Releases
    buildsReleases.Delete Build

Create Another Requirement Operations
    [Tags]  tp48
    requirementSpecificationEdit.Create Another Requirement Operations

Unassign Requirements And Check Availiable Requirements
    [Tags]  tp48
    assignRequirementsNavigator.Unassign Requirements And Check Availiable Requirements




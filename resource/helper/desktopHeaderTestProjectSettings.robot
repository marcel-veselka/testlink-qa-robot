*** Settings ***
Library  Selenium2Library

Resource  ../../resource/helper/desktopHeaderHelper.robot
Resource  ../../resource/pageObjects/loginPage.robot
Resource  ../../resource/pageObjects/desktop/mySettings/mySettings.robot
Resource  ../../resource/pageObjects/desktop/testSpecification/testSpecificationPage.robot
Resource  ../../resource/pageObjects/desktop/testProject/testProjectManagement.robot
Resource  ../../resource/pageObjects/desktop/testProject/platformManagement.robot
Resource  ../../resource/pageObjects/desktop/testProject/assignCustomFields.robot
Resource  ../../resource/pageObjects/desktop/testProject/testProjectEdit.robot
Resource  ../../resource/pageObjects/desktop/userManagement/userManagement.robot
Resource  ../../resource/pageObjects/desktop/requirementSpecification/requirementSpecification(mainframe).robot
Resource  ../../resource/pageObjects/desktop/requirementSpecification/requirementSpecificationEdit.robot
Resource  ../../resource/pageObjects/desktop/requirementSpecification/assignRequirementsNavigator.robot
Resource  ../../resource/pageObjects/desktop/testExecution/executeTestsPage.robot
Resource  ../../resource/pageObjects/desktop/testExecution/reportsAndMetricsPage.robot
Resource  ../../resource/pageObjects/desktop/events/eventsPage.robot
Resource  ../../resource/pageObjects/desktop/testProject/createTestProjectPage.robot
Resource  ../../resource/pageObjects/desktop/testProject/keywordManagement.robot


*** Variables ***

*** Keywords ***

Check header links
    Go to index page and change testproject
    headerPage.I am here in full
    HeaderPage Go to ${mySettings}
    mySettings.I am here
    HeaderPage Go to ${desktop}
    desktopPage.I am here
    HeaderPage Go to ${requirementSpec}
    requirementSpecification(mainframe).I am here
    HeaderPage Go to ${testSpec}
    testSpecificationPage.I am here
    HeaderPage Go to ${testExecution}
    executeTestsPage.I am here
    HeaderPage Go to ${testReports}
    reportsAndMetricsPage.I am here
    HeaderPage Go to ${userManagement}
    userManagement.I am here
    HeaderPage Go to ${events}
    eventsPage.I am here
    HeaderPage Go to ${indexPage}
    headerPage.I am here in full
    HeaderPage Go to ${logout}
    loginPage.I am here

Delete test project
    [Arguments]  ${newTestProjectName}  ${newTestProjectPrefix}
    Go to and check ${testProjectManagement} ${testProjectManagement}
    testProjectManagement.Check and Delete Test Project ${newTestProjectName} ${newTestProjectPrefix}

Start creating new test project without conflict ${newTestProjectName} ${newTestProjectPrefix}
    Go to and check ${testProjectManagement} ${testProjectManagement}
    testProjectManagement.Check Test Project and Click Create ${newTestProjectName} ${newTestProjectPrefix}

Create TP ${newTestProjectName} ${newTestProjectPrefix}
    Start creating new test project without conflict ${newTestProjectName} ${newTestProjectPrefix}
    Fill information to create test without conflict ${newTestProjectName} ${newTestProjectPrefix}
    Submit and check new test project ${newTestProjectName}

Submit and check new test project ${newTestProjectName}
    createTestProjectPage.Click Create
    No warning about existing projects
    testProjectManagement.Check new project exists  ${newTestProjectName}

Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
    Login as admin ${LOGIN} ${PASSWORD}
    loginPage.Check there is no warning about login
    Create TP ${newTestProjectName} ${newTestProjectPrefix}

Create and check role ${role} in user management
    HeaderPage Go to ${userManagement}
    userManagement.Choose bookmark and create role ${role}

Start creating Keyword Management
    [Tags]  tp105, tp126

    Change Test Project and go to ${keywordManagement} ${checkKeywordManagement}
    keywordManagement.Creating Keyword Management

Start editing user
    [Tags]  tp101
    HeaderPage Go to ${userManagement}
    userManagement.Choose desired user

Validate settings fields
    [Tags]  tp96
    HeaderPage Go to ${mySettings}
    mySettings.Wait and Validate

Execute Test Suite
    [Tags]  91
    Change Test Project and go to ${executeTests} ${executeTests}
    executeTestsPage.Execute Test Cases

Execute Test ${testCaseName}
    Change Test Project and go to ${executeTests} ${executeTests}
    executeTestsPage.Expanding tree
    executeTestsPage.Select ${testCaseName} test case node
    executeTestsPage.Execute Test Case

Edit Requirement Operations ${dokumentID} ${title}
    Requirement Operation to Edit Requirement ${dokumentID} ${title}
    Leave Document ID and Title blank
    Warning Message appears DocID
    Leave Document ID blank, fill in Title ${title}
    Warning Message appears DocID
    Fill in Document ID ${dokumentID}, left Title field blank
    Warning Message appears Title
    Change Requirement Status and Type ${dokumentID} ${title}
    Fill the Log

Delete Keyword ${KeywordName}
    Change Test Project and go to ${keywordManagement} ${keywordManagement}
    New ${KeywordName} Delete

Assing and check custom field
    Change Test Project and go to ${AssignCustomFields} ${checkAssignCustomFields}
    Assign Custom Fields
    Check Custom Field Was Assigned


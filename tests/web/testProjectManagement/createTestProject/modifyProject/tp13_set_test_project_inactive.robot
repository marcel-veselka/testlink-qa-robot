*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../pageObjects/loginPage.robot
Resource       ../../../pageObjects/desktop/desktop.robot
Resource       ../../../pageObjects/desktop/requirementSpecification/assignRequirements.robot
Resource       ../../../pageObjects/desktop/requirementSpecification/generateRequirementSpecificationDocument.robot
Resource       ../../../pageObjects/desktop/requirementSpecification/requirementOverview.robot
Resource       ../../../pageObjects/desktop/requirementSpecification/requirementSpecification(mainframe).robot
Resource       ../../../pageObjects/desktop/requirementSpecification/searchRequirements.robot
Resource       ../../../pageObjects/desktop/requirementSpecification/searchRequirementSpecifications.robot
Resource       ../../../pageObjects/desktop/system/defineCustomFields.robot
Resource       ../../../pageObjects/desktop/system/issueTrackerManagement.robot
Resource       ../../../pageObjects/desktop/testProject/assignCustomFields.robot
Resource       ../../../pageObjects/desktop/testProject/assignUserRoles.robot
Resource       ../../../pageObjects/desktop/testProject/keywordManagement.robot
Resource       ../../../pageObjects/desktop/testProject/platformManagement.robot
Resource       ../../../pageObjects/desktop/testProject/testProjectManagement.robot
Resource       ../../../pageObjects/desktop/testSpecification/assignKeywords.robot
Resource       ../../../pageObjects/desktop/testSpecification/searchTestCases.robot
Resource       ../../../pageObjects/desktop/testSpecification/testCasesCreatedPerUser.robot
Resource       ../../../pageObjects/desktop/testSpecification/testSpecification(mainframe).robot

Test Teardown  close browser

*** Test Cases ***
Set Test Project INACTIVE
    Login as Admin
    Go to Test Project Management



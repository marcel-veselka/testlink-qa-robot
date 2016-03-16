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
Test Teardown  close browser
*** Test Cases ***

Login as admin
    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Change Test Project
    Go to My Settings
    Check My Settings
    Go to Desktop (Project)
    Check Desktop (Project)
    Go to Requirement Specification (titlebar)
    Check Requirement Specification (titlebar)
    Go to Test Specification (titlebar)
    Check Test Specification (titlebar)
    Go to Test Execution
    Check Test Execution
    Go to Test Reports
    Check Test Reports
    Go to User Management
    Check User Management
    Go to Events
    Check Events
    Go to index page
    Go to Define Custom Fields
    Check Define Custom Fields
    Go to index page
    Go to Issue Tracker Management
    Check Issue Tracker Management
    Go to index page
    Go to Test Project Management
    Check Test Project Management
    Go to index page
    Go to Assign User Roles
    Check Assign User Roles
    Go to index page
    Go to Assign Custom Fields
    Check Assign Custom Fields
    Go to index page
    Go to Keyword Management
    Check Keyword Management
    Go to index page
    Go to Platform Management
    Check Platform Management
    Go to index page
    Go to Requirement Specification (mainframe)
    Check Requirement Specification (mainframe)
    Go to index page
    Go to Requirement Overview
    Check Requirement Overview
    Go to index page
    Go to Search Requirements
    Check Search Requirements
    Go to index page
    Go to Search Requirement Specifications
    Check Search Requirement Specifications
    Go to index page
    Go to Assign Requirements
    Check Assign Requirements
    Go to index page
    Go to Generate Requirement Specification Document
    Check Generate Requirement Specification Document


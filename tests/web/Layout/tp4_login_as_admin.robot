*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resources/resourcesLayout.robot
#blabla
*** Test Cases ***
Login as admin
    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Change Test Project
    Check My Settings
    Check Desktop (Project)
    Check Requirement Specification (titlebar)
    Check Test Specification
    Check Test Execution
    Check Test Reports
    Check User Management
    Check Events
    Check Define Custom Fields
    Check Issue Tracker Management
    Check Test Project Management
    Check Assign User Roles
    Check Assign Custom Fields
    Check Keyword Management
    Check Platform Management
    Check Requirement Specification (mainframe)
    Check Requirement Overview
    Check Search Requirements
    Check Search Requirement Specifications
    Check Assign Requirements
    Check Generate Requirement Specification Document
    [Teardown]  close browser


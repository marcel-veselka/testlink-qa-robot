*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resources/resourcesLayout.robot

*** Test Cases ***
Login as admin
    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Check My Settings
    Check Descktop
    Check Test Specification
    Check Execute tests
    Check Test Reports
    Check User Roles
    Check Events
    [Teardown]  close browser


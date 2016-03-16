*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../../resources/resourcesTestProjectManagement.robot
Test Teardown  Delete Test Project

*** Test Cases ***
Create new Test Project

    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Select desired frame
    Click Test Project Management
    Create Test Project
    Select Create From Existing Projects = No
    Add Test Project Name
    Add Prefix
    Save Test Project
    Check if Test Project is created




*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../../resources/resourcesTestProjectManagement.robot

*** Test Cases ***
Create new Custom Field

    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Select desired frame
    Click User Management
    Create Test Project
    Select Create From Existing Projects = No
    Add Test Project Name
    Add Prefix
    Save Test Project
    Check if Test Project is created
    [Teardown]  close browser




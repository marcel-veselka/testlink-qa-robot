*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../../resources/resourcesTestProjectManagement.robot

*** Test Cases ***
Create new Test Project template ON

    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Select desired frame
    Click Test Project Management
    Create Test Project
    Select Create From Existing Projects = yes
    Add Test Project Name
    Add Prefix
    Save Test Project
    No warnings
    Check if Test Project is created
    [Teardown]  close browser
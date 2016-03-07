*** Settings ***
Documentation  A test suite with a single test for creating a new Keyword. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resources/resourcesKeywordManagement.robot

*** Test Cases ***
Create Keyword

    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Select desired frame
    Wait a little
    Choose Keyword Management
    Create Keyword
    Enter the name for a keyword1
    Save Keyword
    Wait a little
    Check if Keyword1 is created
    #[Teardown]  close browser
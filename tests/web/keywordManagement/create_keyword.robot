*** Settings ***
Documentation  A test suite with a single test for creating a new Keyword. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resources/resourcesKeywordManagement.robot

*** Test Cases ***
Create Keyword

    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Wait a little
    Select desired frame
    Choose Keyword Management
    Wait a little
    Create Keyword
    Enter the name for a keyword1
    Save Keyword
    Wait a little
    Create Keyword
    Wait a little
    Enter the name for a keyword2
    Wait a little
    Save Keyword
    Wait a little
    Create Keyword
    Wait a little
    Enter the name for a keyword3
    Wait a little
    Save Keyword
    Wait a little
    Check if Keyword1 is created
    Wait a little
    Check if Keyword2 is created
    Wait a little
    Check if Keyword3 is created
    [Teardown]  close browser
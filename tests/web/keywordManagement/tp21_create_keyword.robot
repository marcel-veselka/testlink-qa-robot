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
    Create Keyword
    Enter the name for a Keyword1
    Save Keyword
    #Check if Keyword1 is created   Check je funkcni, zakomentovano jen protoze TC jeste nema Delete Teardown.

    [Teardown]  close browser
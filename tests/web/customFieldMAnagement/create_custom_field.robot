*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../resources/resourcesCustomFieldManagement.robot

*** Test Cases ***
Create new Custom Field

    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Select desired frame
    Select Define Custom Fields
    Create new custom field
    Input the name of the Custom Field
    Input the label of the Custom Field
    Add new Custom Field
    Check id new Custom Field is created
    [Teardown]  close browser

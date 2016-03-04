*** Settings ***

Resource       ../../../resources/resourcesCField.robot

*** Variables ***
#${BROWSER} =  ff

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

#pybot -d ownersManual/Results  ownersManual/tests
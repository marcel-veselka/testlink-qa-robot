*** Settings ***

Resource       ../../../resources/resourcesCField.robot

*** Variables ***
#${BROWSER} =  ff

*** Test Cases ***
Create new Custom Field

    Open Browser To Login Page
    Login as Admin
    Wait a little
    #Select desired frame
    select frame  name=mainframe
    Select Define Custom Fields
    Create new custom field
    Input the name of the Custom Field
    Input the label of the Custom Field
    Add new Custom Field
    Check id new Custom Field is created
    Wait a little
    [Teardown]  close browser

#pybot -d ownersManual/Results  ownersManual/tests
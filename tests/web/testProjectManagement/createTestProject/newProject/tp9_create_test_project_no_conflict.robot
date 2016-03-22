*** Settings ***
Documentation  A test case for creating project without conflict (no existing project)
Resource       ../../../resource/testlink.robot

*** Test Cases ***
Create new Test Project with no conflict
    [Documentation]  This test case test login as admin and check links from header and desktop
    [Tags]
    testlink.Login as admin correct
    testlink.Check header links
    testlink.Check desktop links

#Login as admin correct
    #[Documentation]  This test case test login as admin with correct info
    #[Tags]
    #testlink.Login as admin correct

#Login as admin incorrect
    #[Documentation]  This test case test login as admin with incorrect info
   # [Tags]
    #testlink.Login as admin incorrect


*** Test Cases ***
Create new Test Project with no conflict

    testlink.Login as admin correct
    testlink.go to project management
    check ze nor projektení stejný prefix
    klikni vytvor projekt
    zadej hodnoty
    likni save


    Open Browser To Login Page
    Login as Admin
    Submit Credentials
    Select desired frame
    Click Test Project Management
    Unique prefix or name check
    Create Test Project
    Select Create From Existing Projects = yes
    Add Test Project Name
    Add Prefix
    Save Test Project
    No warnings
    Check if Test Project is created

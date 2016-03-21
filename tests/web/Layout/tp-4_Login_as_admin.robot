*** Settings ***
Documentation  A test case for succesful login as admin with correct login info
Resource       ../../../resource/testlink.robot

*** Test Cases ***
Login as admin correct
    [Documentation]  This test case test login as admin with correct info
    [Tags]
    testlink.Login as admin correct

Login as admin incorrect
    [Documentation]  This test case test login as admin with incorrect info
    [Tags]
    testlink.Login as admin incorrect


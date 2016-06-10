*** Settings ***
Documentation  A test case for creating project without conflict (no existing project)
Resource       ../../../../../resource/testlink.robot
Test Setup  Run keywords  Create new Test Project
...            AND           testlink.go to index page
Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Delete test project  ${newTestProjectName2}  ${newTestProjectPrefix2}
...            AND           Close all browsers

*** Variables ***
${newTestProjectName}  testProject8
${newTestProjectName2}  testProject8_1
${newTestProjectPrefix}  tp8
${newTestProjectPrefix2}  tp8_1
${newTestProjectDescription}  Description of new test project

*** Test Cases ***
Create new Test Project with template ON
    [Tags]  control2
    #testlink.Login as admin correct
    testlink.Start creating new test project
    testlink.Fill information to create test with template ON
    testlink.Submit and check new test project

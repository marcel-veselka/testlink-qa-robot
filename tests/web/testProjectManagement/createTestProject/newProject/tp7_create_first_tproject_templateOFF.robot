*** Settings ***
Documentation  A test case for creating project without conflict (no existing project)
Resource       ../../../../../resource/testlink.robot
Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser

*** Variables ***
${newTestProjectName}  newTestProject78
${newTestProjectPrefix}  newProjectPrefix78
${newTestProjectDescription}  Description of new test project

*** Test Cases ***
Create new Test Project with template off
    testlink.Login as admin correct
    testlink.Start creating new test project
    testlink.Fill information to create test with template OFF
    testlink.Submit and check new test project




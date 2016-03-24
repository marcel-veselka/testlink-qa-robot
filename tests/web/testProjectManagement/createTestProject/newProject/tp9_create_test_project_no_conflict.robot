*** Settings ***
Documentation  A test case for creating project without conflict (no existing project)
Resource       ../../../../../resource/testlink.robot
Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser

*** Variables ***
${newTestProjectName}  newTestProject
${newTestProjectPrefix}  newProjectPrefix
${newTestProjectDescription}  Description of new test project

*** Test Cases ***
Create new Test Project with no conflict
    testlink.Login as admin correct
    testlink.Start creating new test project without conflict
    testlink.Fill information to create test without conflict
    testlink.Submit and check new test project
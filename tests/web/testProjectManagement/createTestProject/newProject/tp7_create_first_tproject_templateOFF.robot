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
Create new Test Project with template off
    Login as admin correct
    Start creating new test project
    Fill information to create test with template OFF
    Submit and check new test project




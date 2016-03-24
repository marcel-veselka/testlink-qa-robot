*** Settings ***
Documentation  A test case for creating project without conflict (no existing project)
Resource       ../../../../../resource/testlink.robot
Test Setup  Create new Test Project
Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Delete test project  ${newTestProjectName2}  ${newTestProjectPrefix2}
...            AND           Close all browsers

*** Variables ***
${newTestProjectName}  newTestProject
${bla}                  bla
${bla2}                 bla2
${newTestProjectName2}  newTestProject2
${newTestProjectPrefix}  newProjectPrefx
${newTestProjectPrefix2}  newProjectPrefx2
${newTestProjectDescription}  Description of new test project

*** Test Cases ***
Create new Test Project with template ON
    testlink.Login as admin correct
    testlink.Start creating new test project
    testlink.Fill information to create test with template ON
    testlink.Submit and check new test project

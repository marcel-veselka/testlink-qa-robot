*** Settings ***
Documentation  A test case for creating project without conflict (no existing project)

Resource       ../../../../../resource/testlink.robot

Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser

*** Variables ***
${newTestProjectName}  testProject7
${newTestProjectPrefix}  tp7
${newTestProjectDescription}  Description of new test project7

*** Test Cases ***
Create new Test Project with template off
    testlink.Login as admin correct
    testlink.Start creating new test project
    testlink.Fill information to create test with template OFF
    testlink.Submit and check new test project



#pybot -d results tests/web/testProjectManagement/createTestProject/newProject/tp7_create_first_tproject_templateOFF.robot
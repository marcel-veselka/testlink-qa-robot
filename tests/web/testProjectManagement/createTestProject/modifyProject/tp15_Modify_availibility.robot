*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../../resource/testlink.robot
Test Setup  Create new Test Project
Test Teardown  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}


*** Variables ***

${newTestProjectName}  testProject15
${newTestProjectPrefix}  tp15


*** Test Cases ***

Change Project Availibility

    testlink.Login as admin correct
    testlink.Go to Test Project Management
    testlink.Click desired project
    testlink.Unselect Checkbox Availibility Active
    testlink.Check Test Project Is Inactive
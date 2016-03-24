*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.
Resource       ../../../../../resource/testlink.robot
Test Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser
*** Variables ***

${newTestProjectName}  newTestProjectEnch
${newTestProjectPrefix}  newProjectPrefixEnch

*** Test Cases ***

Create new Test Project with enhanced features

    Login as admin correct
    Start creating new test project (enchanced features)
    Fill information to create test (enchanced feautures)
    Submit and check new test project
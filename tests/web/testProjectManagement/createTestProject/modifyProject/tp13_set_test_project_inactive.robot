*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.

Resource        ../../../../../resource/testlink.robot

Test Setup  Create new Test Project
Test Teardown  Delete Test Project  ${newTestProjectName}  ${newtestprojectprefix}


*** Variables ***

${newTestProjectName}  testProject13
${newtestprojectprefix}  tp13


*** Test Cases ***

Set Test Project INACTIVE


    testlink.Click desired project

    testlink.Unselect Checkbox Availibility Active

    testlink.Unactive Test Project by Bulb

    testlink.Check Test Project Is Active




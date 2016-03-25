*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.

Resource        ../../../../../resource/pageObjects/desktop/testProject/testProjectManagement.robot
Resource        ../../../../../resource/testlink.robot

Test Setup  Create new Test Project
Test Teardown  Delete Test Project  ${newTestProjectName}  ${newtestprojectprefix}

*** Variables ***

${newTestProjectName}  ProjectName1
${newtestprojectprefix}  122


*** Test Cases ***

Set Test Project INACTIVE


    testlink.Click desired project

    testlink.Unselect Checkbox Availibility Active

    testProjectManagement.Unactive Test Project by Bulb

    testProjectManagement.Check Test Project Is Active




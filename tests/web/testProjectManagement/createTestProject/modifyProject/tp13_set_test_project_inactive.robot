*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.
#Resource        ../../../../../pageObjects/testProjectManagementPage.robot
Resource        ../../../../../resource/testlink.robot

Test Setup  Create Empty Test Project
#Test Teardown  Delete Test Project

*** Variables ***

${testprojectname}  ProjectName1
${testprojectprefix}  122


*** Test Cases ***

Set Test Project INACTIVE

    desktopPage.Go to Test Project Management
    testProjectManagement.Select Created Test Project
#dodelam ve ctvrtek 24.3 - VOjta


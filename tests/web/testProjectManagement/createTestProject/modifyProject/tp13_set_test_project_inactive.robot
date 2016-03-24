*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.

Resource        ../../../../../resource/pageObjects/desktop/testProject/testProjectManagement.robot
Resource        ../../../../../resource/testlink.robot

#Test Setup  Create Empty Test Project
#Test Teardown  Delete Test Project

*** Variables ***

${testprojectname}  ProjectName1
${testprojectprefix}  122


*** Test Cases ***

Set Test Project INACTIVE


    testlink.Create new Test Project

    testlink.Click desired project

    testlink.Unselect Checkbox Availibility Active

    testProjectManagement.Select Active Test Project



#dodelam ve ctvrtek 24.3 - VOjta


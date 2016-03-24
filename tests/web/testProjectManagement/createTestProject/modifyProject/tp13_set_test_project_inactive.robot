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








    loginPage.Open Browser To Login Page
    loginPage.Login as Admin
    loginPage.Submit Credentials

    desktopPage.Go to Test Project Management
    testProjectManagement.Click Create
    testProjectManagement.Add Test Project Name
    testProjectManagement.Add Prefix
    testProjectManagement.Create Test Project


    testProjectManagement.Check new project exists

    testProjectManagement.Click desired project

#dodelam ve ctvrtek 24.3 - VOjta


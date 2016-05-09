*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.

Resource        ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject

Test Teardown  Run keywords  Delete Test Project  ${newTestProjectName1}  ${newtestprojectprefix1}
...             AND         close browser

*** Variables ***

${newTestProjectName}       testProject12
${newtestprojectprefix}     tp12
${testprojectname}
${testprojectprefix}
${newTestProjectName1}      testProject12_1
${newtestprojectprefix1}    tp12_1


*** Test Cases ***
Rename test project
    testlink.Go to Test Project And Select It
    testlink.Leave empty TP name and prefix
    testlink.Fill and Valid  ${newTestProjectName1}


#pybot -d results tests\web\testProjectManagement\createTestProject\modifyProject\tp12_Rename_Test_Project_NO_NAME_CONFLICT.robot
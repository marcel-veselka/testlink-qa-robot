*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.

Resource        ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject

Test Teardown  Delete Test Project  ${newTestProjectName1}  ${newtestprojectprefix1}

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







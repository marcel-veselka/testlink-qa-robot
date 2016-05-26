*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.

Resource        ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test suite ${testSuiteName1} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}

#Test Teardown  Run keywords  Delete Test Project  ${newTestProjectName}  ${newtestprojectprefix}
#...             AND          close browser

*** Variables ***

${newTestProjectName}       testProject77
${newtestprojectprefix}     tp77
${testprojectname}
${testprojectprefix}
${testSuiteName}                    tsuite77
${testSuiteName1}                   tsuite77_1
${testCaseName}                     tc77



*** Test Cases ***
Set Urgent Test
    testlink.Go to index page



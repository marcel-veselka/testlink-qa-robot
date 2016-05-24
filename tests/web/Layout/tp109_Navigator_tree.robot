*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.

Resource        ../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test suite ${testSuiteName1} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}

#Test Teardown  Run keywords  Delete Test Project  ${newTestProjectName}  ${newtestprojectprefix}
#...             AND          close browser

*** Variables ***

${newTestProjectName}       testProject109
${newtestprojectprefix}     tp109
${testprojectname}
${testprojectprefix}
${testSuiteName}                    tsuite109
${testSuiteName1}                   tsuite109_1
${testCaseName}                     tc109



*** Test Cases ***
Navigator tree
    testlink.Go to index page
    testlink.Go to Test Specification (mainframe)
    testlink.Click on Expand tree
    testlink.Check tree expanded
    testlink.Click on Collapse tree
    testlink.Check Collapse tree
    testlink.Click on the white arrow on the left side of the Test Project
    testlink.Click on the black arrow on the left side of the Test Project

    #testlink.Check Collapse tree
    #testlink.Click on the white arrow on the left side of the Test Project
    #testlink.Click on the black arrow on the left side of the Test Project






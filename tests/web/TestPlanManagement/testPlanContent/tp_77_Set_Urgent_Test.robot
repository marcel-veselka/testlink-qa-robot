*** Settings ***
Documentation  A test suite with a single test for creating a new Test Project. This test has
...            a workflow that is created using keywords from the resource file.

Resource        ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         desktopPage.Go to Test Plan Management
#...             AND         testPlanManagement.Create Test Plan Management
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test suite ${testSuiteName1} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         headerPage.Go to index page and change testproject
#...             AND         testlink.Create Build with name ${buildName}
#...             AND         headerPage.Go to index page and change testproject
#...            AND         testlink.Create Platform ${PlatformName}

#Test Teardown  Run keywords  Delete Test Project  ${newTestProjectName}  ${newtestprojectprefix}
#...             AND          close browser

*** Variables ***

${newTestProjectName}       testProject77
${newtestprojectprefix}     tp77
${testprojectname}          tpn77
${testprojectprefix}        tpxn77
${testSuiteName}                    tsuite77
${testSuiteName1}                   tsuite77_1
${testCaseName}                     tc77
${TestPlanName}                     tpname77
${buildName}                        bn77
${PlatformName}                     pfn77
${buildDescription}             sdjkgfksdh
*** Test Cases ***
Set Urgent Test
    testlink.Go to index page
    testlink.Click on Set Urgent Tests
    testlink.Click and Select Test Suite
    testlink.Go to index page
    desktopPage.Go to Add/Remove Test Cases
    testlink.Go to select test case
    testlink.Check adding and select buttons
    testlink.Go to index page
    testlink.Click on Set Urgent Tests
    testlink.Go to select test case
    testlink.Go check proiority
    testlink.Go to index page
    testlink.Click on Set Urgent Tests
    testlink.Go to select test case
    desktopPage.check if Checkbox high is selected
    testlink.Go to index page
    #testlink.Go Add or Remove TC
    #testlink.Filter and select test case

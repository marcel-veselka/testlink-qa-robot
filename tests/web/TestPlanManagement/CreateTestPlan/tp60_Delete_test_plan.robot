*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create New Version Of TC
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Platform ${PlatformName}
...             AND         testlink.Add Platform to Test Plan
...             AND         testlink.Create Build with name ${buildName}
...             AND         Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
...             AND         headerPage.go to index page

Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser

*** Variables ***

${newTestProjectName}           testProject60
${newTestProjectPrefix}         tp60
${newTestProjectDescription}    DesctiptioneOfTestProject60
${testSuiteName}                tsuite60
${testCaseName}                 tc60
${TestPlanName}                 testPlan60
${TestPlanDescription}          DescriptionOfTestPlan60
${PlatformName}                 Platform60
${buildName}                    buildName60
${buildDescription}             DescriptionOfBuild60
${Username}                     renat.kulalov


*** Test Cases ***

Delete Test Plan
    [Tags]  controll
    testlink.Delete Test Plan Management  ${TestPlanName}
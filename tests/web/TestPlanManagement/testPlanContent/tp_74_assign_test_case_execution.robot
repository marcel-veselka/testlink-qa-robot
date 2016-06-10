*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Platform ${PlatformName}
...             AND         testlink.Create Platform ${PlatformName1}
...             AND         testlink.Add Platform to Test Plan
...             AND         testlink.Create Build with name ${buildName}
...             AND         headerPage.go to index page


Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser


*** Variables ***
${newTestProjectName}  testProject74
${newTestProjectPrefix}  tp74
${newTestProjectDescription}  DesctiptioneOfTestProject74
${testSuiteName}  tsuite74
${testCaseName}  tc74
${TestPlanName}  testPlan74
${TestPlanDescription}  DescriptionOfTestPlan74
${PlatformName}  Platform74
${PlatformName1}  Platform74_1
${buildName}        buildName74
${Username}     renat.kulalov
${Username1}     jan.pippal
${buildDescription}  DescriptionOfBuild74

*** Test Cases ***

Assign Test Case Execution
    [Tags]  control2
    desktopPage.go to Add/Remove Test Cases
    testlink.Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
    testlink.Add TC ${testCaseName} to platform ${PlatformName1} users ${Username1}
    testlink.Check Assigned TC to ${Username} and ${PlatformName}
    testlink.Check Assigned TC to ${Username1} and ${PlatformName1}
    testlink.Unassign TC ${PlatformName}
    testlink.Unassign TC ${PlatformName1}
    testlink.Add TC ${testCaseName} to platform ${PlatformName} users ${Username1}
    testlink.Add TC ${testCaseName} to platform ${PlatformName1} users ${Username}
    testlink.Check Assigned TC to ${Username} and ${PlatformName1}
    testlink.Check Assigned TC to ${Username1} and ${PlatformName}
    testlink.Unassign TC ${PlatformName}
    testlink.Unassign TC ${PlatformName1}
    testlink.Check TC Are Not Assigned ${testSuiteName}




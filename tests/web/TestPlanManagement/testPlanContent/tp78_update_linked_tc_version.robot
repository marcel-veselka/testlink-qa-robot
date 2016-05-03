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
...             AND         testlink.Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
...             AND         headerPage.go to index page

Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser

*** Variables ***

${newTestProjectName}  testProject78
${newTestProjectPrefix}  tp78
${newTestProjectDescription}  DesctiptioneOfTestProject78
${testSuiteName}  tsuite78
${testCaseName}  tc78
${TestPlanName}  testPlan78
${TestPlanDescription}  DescriptionOfTestPlan78
${PlatformName}  Platform78
${buildName}        buildName78
${buildDescription}  DescriptionOfBuild78
${Username}

*** Test Cases ***

Update Linked TC version
    testlink.Update linked TC ${testCaseName} ${testSuiteName} version
    testlink.Check TC Version was changed ${testCaseName} ${testSuiteName} in Update Linked TC Version
    testlink.Check TC Version was changed ${testCaseName} ${testSuiteName} in Assign TC Execution


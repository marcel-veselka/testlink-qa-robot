*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create Build with name ${buildName}
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         headerPage.Go to index page



Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser


*** Variables ***

${newTestProjectName}               testProject90
${newTestProjectPrefix}             tp90
${TestPlanName}                     testPlan90
${TestPlanDescription}              DescriptionOfTestPlan90
${buildName}                        buildName90
${buildDescription}                 DescriptionOfBuild90
${testSuiteName}                    tsuite90
${testDescription}                  testDescription90
${testCaseName}                     tc90
${testCaseName2}                    tc90_1

*** Test Cases ***

Test Case Operations
    [Tags]  controll
    desktopPage.Go to Test Specification (mainframe)
    testlink.Create New Sibling ${testCaseName2}
    testlink.Check All Actions Buttons For Test Case
    testlink.Add Test Case To the Test Plan
    testlink.Execute Test
    testlink.Show Execution History




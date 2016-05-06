*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Build with name ${buildName}
...             AND         testlink.Create Test Suite
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName2} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName3} in ${testSuiteName}




Test Teardown  Run keywords         testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND                 testlink.Check that test has been deleted
...             AND                 Close browser

*** Variables ***

${newTestProjectName}               testProject91
${newTestProjectPrefix}             tp91
${testSuiteName}                    tsuite91
${testDescription}                  DescriptionOfTest91
${testCaseName}                     tc91
${testCaseName2}                    tc91_1
${testCaseName3}                    tc91_2
${TestPlanName}                     testPlan91
${TestPlanDescription}              DecriptionOfTestPlan91
${buildName}                        buildName91
${buildDescription}                 DescriptionOfBuild91



*** Test Cases ***

Execute Test
    [Tags]  controll
    testlink.Add Test Suite to Test Plan
    testlink.Execute Test Suite


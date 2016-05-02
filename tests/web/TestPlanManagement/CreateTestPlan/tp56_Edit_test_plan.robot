*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create New Test Plan ${TestPlanName1}
...             AND         testlink.Create Build with name ${buildName}
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Add Test Case To the Test Plan

Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser




*** Variables ***

${newTestProjectName}               testProject56
${newTestProjectPrefix}             tp56
${TestPlanName}                     testPlan56
${TestPlanName1}                    testPlan56_1
${EditTestPlanName}                 testPlan56_2
${TestPlanDescription}              DescriptionOfTestPlan56
${buildDescription}                 DescriptionOfBuild56
${testCaseNameNew}                  tc56_1
${testCaseName}                     tc56
${testSuiteName}                    tsuite56
${buildName}                        buildName56

*** Test Cases ***

Edit Test Plan
    testlink.Order By Test Case, Name, Build In Test Plan Management
    testlink.Make all Test Plan Active/Inactive
    testlink.Edit And Check Test Plan


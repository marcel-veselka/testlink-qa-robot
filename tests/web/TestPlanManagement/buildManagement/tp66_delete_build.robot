*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         testlink.Create Build with name ${buildName}

Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TestPlanName}
...            AND           testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser







*** Variables ***

${buildName}  buildName66
${buildDescription}  DescriptionOfBuild66
${TestPlanName}  testPlan66
${newTestProjectName}  testProject66
${newTestProjectPrefix}  tp66
${TestPlanDescription}  DescriptionOfTestPlan66

*** Test Cases ***

Delete Build
    testlink.Delete build ${buildName}
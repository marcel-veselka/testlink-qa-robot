*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         headerPage.Go to index page


Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser


*** Variables ***

${newTestProjectName}  testProject54
${newTestProjectPrefix}  tp54
${newTestProjectDescription}  DesctiptioneOfTestProject54
${TestPlanName}  testPlan54
${TestPlanName2}  testPlan54_1
${TestPlanDescription}  DescriptionOfTestPlan54

*** Test Cases ***

Create test plan AS COPY

     testlink.Create Test Plan Management AS COPY






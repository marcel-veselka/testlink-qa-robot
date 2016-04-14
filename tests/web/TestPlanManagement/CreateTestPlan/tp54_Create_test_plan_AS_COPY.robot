*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login as admin correct
...             AND         testlink.Create New Test Plan ${TestPlanName}
...             AND         Close Browser


Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TestPlanName2}
...             AND          testlink.Delete Test Plan Management  ${TestPlanName}
...             AND          Close browser


*** Variables ***

${TestPlanName}  testPlan54
${TestPlanName2}  testPlan54_1
${TestPlanDescription}  DescriptionOfTestPlan54

*** Test Cases ***

Create test plan AS COPY

     testlink.Login as admin correct
     testlink.Create Test Plan Management AS COPY






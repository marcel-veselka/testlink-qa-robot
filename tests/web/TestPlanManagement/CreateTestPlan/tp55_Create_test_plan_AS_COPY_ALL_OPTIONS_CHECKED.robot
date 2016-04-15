*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login as admin correct
...             AND         testlink.Start creating new test project
...             AND         testlink.Fill information to create test without conflict
...             AND         testlink.Submit and check new test project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}


Test Teardown  Run keywords     testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close browser


*** Variables ***

${TestPlanName}  testPlan55
${TestPlanDescription}  DescriptionOfTestPlan55
${newTestProjectName}  testProject55
${newTestProjectPrefix}  tp55
${TestPlanName2}  testPlan55_1

*** Test Cases ***

Create test plan AS COPY ALL OPTIONS CHECKED

    headerPage.Go to index page
    testlink.Click on Test Plan Management
    testlink.Create Test Plan Management AS COPY NOK
    testlink.Create Test Plan Management AS COPY Unselect all checkboxes






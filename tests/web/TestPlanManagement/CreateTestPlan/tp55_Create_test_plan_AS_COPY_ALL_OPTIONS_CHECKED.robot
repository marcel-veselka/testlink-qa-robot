*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login as admin correct
...             AND         testlink.Start creating new test project
...             AND         testlink.Fill information to create test without conflict
...             AND         testlink.Submit and check new test project
...             AND         headerPage.Go to index page
...             AND         testlink.Create New Test Plan Management


Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TestPlanManagementName}
...             AND         testlink.Delete Test Plan Management  ${TestPlanManagementName2}
...             AND          testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND          testlink.Check that test has been deleted
...             AND          headerPage.Go to index page
...             AND          Close browser


*** Variables ***

${TestPlanManagementName}  TestplanNumberOne
${TestPlanManagementDescription}  DescriptionDescription
${newTestProjectName}  testProjectName
${newTestProjectPrefix}  128
${TestPlanManagementName2}  testPlanNumberTwo

*** Test Cases ***

Create test plan AS COPY ALL OPTIONS CHECKED

    headerPage.Go to index page
    testlink.Click on Test Plan Management
    testlink.Create Test Plan Management AS COPY NOK
    testlink.Create Test Plan Management AS COPY Unselect all checkboxes






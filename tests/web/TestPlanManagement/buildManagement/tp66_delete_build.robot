*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan Management
...             AND         testlink.Create Build

Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TestPlanManagementName}
...             AND          testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND          testlink.Check that test has been deleted
...             AND          close browser


*** Variables ***

${BuildName}  BuildName
${Description}  Description
${TestPlanManagementName}  TestplanNumberOne
${newTestProjectName}  testProjectName
${newTestProjectPrefix}  128
${TestPlanManagementDescription}  DescriptionDescription

*** Test Cases ***
Delete Build
    testlink.Delete Build
*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan Management
...             AND         testlink.Create Build


Test Teardown  Run keywords  testlink.Delete Build
...            AND           testlink.Delete Test Plan Management  ${TestPlanManagementName}
...             AND          testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND          testlink.Check that test has been deleted
...            AND           Close browser


*** Variables ***

${BuildName}  BuildName1
${Description}  Description
${TestPlanManagementName}  TestplanNumberOne1
${newTestProjectName}  testProjectName1
${newTestProjectPrefix}  129
${TestPlanManagementDescription}  DescriptionDescription

*** Test Cases ***

Create Build - "Easy" - from existing build


    headerPage.Go to index page and change testproject
    testlink.Start creating build


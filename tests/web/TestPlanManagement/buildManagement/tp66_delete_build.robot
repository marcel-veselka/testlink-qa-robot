*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanManagementName}
...             AND         testlink.Create Build with name buildName

Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TestPlanManagementName}
...            AND           testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser







*** Variables ***

${BuildName}  BuildName
${Description}  Description
${TestPlanManagementName}  TestplanNumberOne
${newTestProjectName}  testProjectNameWW
${newTestProjectPrefix}  12899
${TestPlanManagementDescription}  DescriptionDescription

*** Test Cases ***

Delete Build
    testlink.Delete build buildName
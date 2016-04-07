*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan Management
...             AND         testlink.Create Build with name buildName


Test Teardown  Run keywords  testlink.Delete Build buildName
...            AND           testlink.Delete Build buildName1
...            AND           testlink.Delete Test Plan Management  ${TestPlanManagementName}
...             AND          testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser


*** Variables ***

${buildName}  BuildName1
${BuildName2}  NewBuild
${Description}  Description
${TestPlanManagementName}  TestplanNumberOne1
${newTestProjectName}  testProjectName1
${newTestProjectPrefix}  129
${TestPlanManagementDescription}  DescriptionDescription
${FromBuild}  ${BuildName}

*** Test Cases ***

Create Build - "Easy" - from existing build


    headerPage.Go to index page and change testproject
    testlink.Create buildName1 from existing buildName


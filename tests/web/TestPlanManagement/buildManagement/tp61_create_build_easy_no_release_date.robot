*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanManagementName}



Test Teardown  Run keywords  testlink.Delete Build ${buildName}
...            AND           testlink.Delete Test Plan Management  ${TestPlanManagementName}
...            AND           testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser


*** Variables ***

${buildName}  BuildName
${Description}  Description
${TestPlanManagementName}  TestplanNumberOne
${newTestProjectName}  testProjectNameMM
${newTestProjectPrefix}  12822
${TestPlanManagementDescription}  DescriptionDescription

*** Test Cases ***

Create Build - "Easy" - No release date

    headerPage.Go to index page and change testproject
    testlink.Start creating build with warning
    testlink.Add Details and Finish creating build ${buildName}
    testlink.Check that Build is created ${buildName}


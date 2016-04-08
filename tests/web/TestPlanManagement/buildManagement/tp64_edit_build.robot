*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanManagementName}
...             AND         testlink.Create Build with name buildName

Test Teardown  Run keywords  testlink.Delete Build ${NewBuildName}
...            AND           testlink.Delete Test Plan Management  ${TestPlanManagementName}
...            AND           testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND           Close browser

*** Variables ***
${NewBuildName}  NewBuildName
${BuildName}  BuildName
${Description}  Description
${TestPlanManagementName}  TestplanNumberOne
${newTestProjectName}  testProjectName
${newTestProjectPrefix}  128
${TestPlanManagementDescription}  DescriptionDescription

*** Test Cases ***
Edit Build
        headerPage.Go to index page and change testproject
        desktopPage.Go to link Builds / Releases
        buildsReleases.Select Build buildName
        testlink.Edit Build Info and Save Changes
        buildsReleases.Check if Build was created ${NewBuildName}



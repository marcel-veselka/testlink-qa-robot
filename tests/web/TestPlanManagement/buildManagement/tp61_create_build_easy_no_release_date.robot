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
...            AND           testlink.Delete Build
...            AND           Close browser


*** Variables ***
${BuildName}  BuildName
${Description}  Description
${TestPlanManagementName}  TestplanNumberOne
${newTestProjectName}  testProjectName
${newTestProjectPrefix}  128
${TestPlanManagementName2}  testPlanNumberTwo
*** Test Cases ***

Create Build - "Easy" - No release date

    headerPage.Go to index page
    testlink.Start creating build
    testlink.Add Details and Finish creating build
    testlink.Check that Build is created


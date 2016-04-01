*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login as admin correct
...             AND         testlink.Start creating new test project
...             AND         testlink.Fill information to create test without conflict
...             AND         testlink.Submit and check new test project
...             AND         Close browser


#Test Teardown  Run keywords
#...             AND         testlink.Delete Test Plan Management  ${TestPlanManagementName}
#...             AND          testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
#...             AND          testlink.Check that test has been deleted
#...             AND          Close browser


*** Variables ***

${TestPlanManagementName}  TestplanNumberOne
${TestPlanManagementDescription}  DescriptionDescription
${newTestProjectName}  testProjectName
${newTestProjectPrefix}  128

*** Test Cases ***

Create test plan AS COPY ALL OPTIONS CHECKED

    testlink.Click on Test Plan Management






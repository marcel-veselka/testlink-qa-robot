*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Login as admin correct
...             AND         testlink.Create New Test Plan Management
...             AND         Close Browser


Test Teardown  Run keywords  testlink.Delete Test Plan Management  ${TestPlanManagementName2}
...             AND          testlink.Delete Test Plan Management  ${TestPlanManagementName}
...             AND          Close browser


*** Variables ***

${TestPlanManagementName}  TestplanNumberOne
${TestPlanManagementName2}  TestplanNumbertwoCOPY
${TestPlanManagementDescription}  DescriptionDescription

*** Test Cases ***

Create new test plan

     testlink.Login as admin correct
     testlink.Create Test Plan Management AS COPY



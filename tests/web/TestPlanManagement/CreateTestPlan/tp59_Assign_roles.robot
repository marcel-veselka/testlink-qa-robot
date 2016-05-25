*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create New Test Plan ${TestPlanName}

Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser

*** Variables ***

${newTestProjectName}           testProject59
${newTestProjectPrefix}         tp59
${newTestProjectDescription}    DesctiptioneOfTestProject59
${testSuiteName}                tsuite59
${testCaseName}                 tc59
${TestPlanName}                 testPlan59
${TestPlanDescription}          DescriptionOfTestPlan59





*** Test Cases ***

Assign Roles
    [Tags]  controll
    testlink.Assign Roles
    testlink.Check That Roles Were Assigned
    #testlink.Check That Roles Were Assigned

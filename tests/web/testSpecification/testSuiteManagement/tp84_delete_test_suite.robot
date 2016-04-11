*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Create test case ${testCaseName1} in ${testSuiteName}
...             AND         testlink.Create New Test Plan Management

*** Variables ***
${newTestProjectName}  ProjectRenat
${newTestProjectPrefix}  RenatPRF
${newTestProjectDescription}  DesctiptionRenat
${testSuiteName}  RenatTS
${testCaseName}  RenatTC1
${testCaseName1}  RenatTC2
${TestPlanManagementName}  TestplanRenat
*** Test Cases ***
Delete Test Suite
    sleep  10
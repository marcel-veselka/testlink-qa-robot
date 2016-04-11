*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Create test case ${tc1} in ${testSuiteName}
...             AND         testlink.Create test case ${tc2} in ${testSuiteName}


Test Teardown  Run keywords    testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser
*** Variables ***
${newTestProjectName}  ProjectRenat
${newTestProjectPrefix}  RenatPRF
${newTestProjectDescription}  DesctiptionRenat
${testSuiteName}  RenatTS
${tc1}  RenatTC1
${tc2}  RenatTC2
${TestPlanManagementName}  TestplanRenat
${TestPlanManagementDescription}  DRenat

*** Test Cases ***

Delete Test Suite
    headerPage.Go to index page and change testproject
    desktopPage.Go to Test Specification (mainframe)
    testSpecificationPage.Delete New Test Suite
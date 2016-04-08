*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create test suite ${testSuiteName} in test project ${newTestProjectName}
...             AND         testlink.Check New Test Suite
...             AND         testlink.Create test case ${testCaseName} in ${testSuiteName}
...             AND         testlink.Go to index page

Test Teardown  Run keywords     testlink.Delete New Test Suite
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Check that test has been deleted
...             AND              Close browser

*** Variables ***

${newTestProjectName}       NewProject
${newTestProjectPrefix}     np
${testSuiteName}            suiteTest
${testDescription}          testDescription
${testCaseName}             testCaseName
${testCaseNameNew}          testCaseNameNew

*** Test Cases ***

Create Test Case

    desktopPage.Go to Test Specification (mainframe)
    testlink.Create New Sibling ${testCaseNameNew}
    testlink.Check All Actions Button


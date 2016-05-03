*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject
...             AND         testlink.Create Test Suite
...             AND         testlink.Check New Test Suite
...             AND         testlink.Go to index page

Test Teardown  Run keywords    testlink.Go to index page
...             AND              testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Check that test has been deleted
...             AND              Close browser

*** Variables ***

${newTestProjectName}           testProject86
${newTestProjectPrefix}         tp86
${testSuiteName}                tsuite86
${testDescription}              testDescription86
${testCaseName}                 tc86



*** Test Cases ***

Create Test Case

    desktopPage.Go to Test Specification (mainframe)
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Select test suite ${testSuiteName} node
    testlink.Start Creating Test Case
    testlink.Fill informations test case and create
    testlink.Create Step in test case: ${testCaseName}
    testSpecificationPage.Add Step after created first step
    testSpecificationPage.Click on save & exit



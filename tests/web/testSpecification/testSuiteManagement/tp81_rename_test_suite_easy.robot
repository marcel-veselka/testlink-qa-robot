*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject


Test Teardown  Run keywords     testlink.Delete Another New Test Suite
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Check that test has been deleted
...             AND             Close browser

*** Variables ***

${newTestProjectName}  testProject81
${newTestProjectPrefix}  tp81
${testSuiteName}    tsuite81
${testDescription}  testDescription81
${testDescriptionCopy}  CopyTestDescription81
${testSuiteCopy}  tsuite81_1

*** Test Cases ***

Rename Test Suite Easy
        testlink.Controll Warning Message And Create Test Suite
        testlink.Check New Test Suite
        testlink.Edit Test Suite Move It Copy It



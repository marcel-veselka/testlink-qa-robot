*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Teardown  Run keywords  testlink.Delete Build
...            AND           Close browser


*** Variables ***
${BuildName}  BuildName
${Description}  Description

*** Test Cases ***

Create Build - "Easy" - No release date
    testlink.login as admin correct
    testlink.Start creating build
    testlink.Add Details and Finish creating build
    testlink.Check that Build is created


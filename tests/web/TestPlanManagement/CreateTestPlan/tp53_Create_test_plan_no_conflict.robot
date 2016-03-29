*** Settings ***
Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.
#Resource       ../resource/pageObjects/desktop/desktopPage.robot
Resource       ../../../resource/testlink.robot
#Test Teardown  Run keywords  testlink.Delete Custom Field
#...            AND           Close browser


*** Variables ***

*** Test Cases ***

Create new test plan

    testlink.Create New Test Plan


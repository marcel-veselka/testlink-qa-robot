*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../resource/testlink.robot
Test Setup  Login as admin correct
Test Teardown  Run keywords  testlink.Delete Requirement Specification
...            AND           testlink.Delete Test Case
...            AND           Close browser
*** Variables ***

${dokumentID}   newdokumentid
${title}        newtitle



*** Test Cases ***

Modify requirement

        testlink.Change and check test project with RS control
        testlink.Go to Requirement Specification (mainframe)
        testlink.Create New Requirement Specification (type URS)
        testlink.Choose Requirement Specification
        testlink.Create Requirement Operations
        testlink.Create Test Case From Requirement
        testlink.Go to index page
        testlink.Go to Assign Requirements
        testlink.Select Test Suite
        testlink.Assign Requirements
        testlink.Check Assign Requirements


*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../resource/testlink.robot
Test Setup  testlink.Login as admin correct
Test Teardown  Run keywords  testlink.Delete Requirement Specification
...            AND           testlink.Delete Test Suite
...            AND           Close browser
*** Variables ***

${dokumentID}   newdokumentid
${title}        newtitle
${dokumentID1}   newdokumentid1
${title1}        newtitle1



*** Test Cases ***

Relations between requirements and test cases

        testlink.Change and check test project with RS control
        testlink.Go to Requirement Specification (mainframe)
        testlink.Create New Requirement Specification (type URS)
        testlink.Choose Requirement Specification
        testlink.Create Requirement Operations
        testlink.Create Another Requirement Operations
        testlink.Create Test Case From Requirement
        testlink.Go to index page
        testlink.Go to Assign Requirements
        testlink.Select Test Suite
        testlink.Assign Requirements
        testlink.Unassign Requirements And Check Availiable Requirements

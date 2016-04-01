*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../../resource/testlink.robot
Test Setup  Login as admin correct
Test Teardown  Run keywords  testlink.Delete Requirement Specification
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
        testlink.Create New Version Of Requirement
        testlink.Go to index page
        testlink.Go to Requirement Specification (mainframe)
        testlink.Choose Requirement Specification
        testlink.Delete Requirement Specification NO
        testlink.Select More Than 1 Version Requirement
        testlink.Delete More Than 1 Version Requirement
        testlink.Check Requirement Version
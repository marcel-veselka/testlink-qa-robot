*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../resource/testlink.robot

Test Setup  Run keywords    testlink.Create new Test Project
...             AND         headerPage.Go to index page and change testproject

Test Teardown  Run keywords     testlink.Delete Requirement Specification
...             AND             testlink.Delete Test Suite
...             AND             testlink.Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             testlink.Check that test has been deleted
...             AND             Close browser
*** Variables ***

${dokumentID}   newdokumentid48
${title}        newtitle48
${dokumentID1}   newdokumentid48_1
${title1}        newtitle48_1
${newTestProjectName}  testProject48
${newTestProjectPrefix}  tp48



*** Test Cases ***

Relations between requirements and test cases

        #testlink.Change and check test project with RS control
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

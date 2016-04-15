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

${dokumentID}   newdokumentid47
${title}        newtitle47
${newTestProjectName}  testProject47
${newTestProjectPrefix}  tp47



*** Test Cases ***

Assign Requirements

        #testlink.Change and check test project with RS control
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



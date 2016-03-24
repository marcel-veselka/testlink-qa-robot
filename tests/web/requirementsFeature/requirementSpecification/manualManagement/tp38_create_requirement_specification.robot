*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../../resource/testlink.robot
Test Setup  Login as admin correct
#Test Teardown  close browser

*** Variables ***

${dokumentID}   newdokumentid
${title}        newtitle


*** Test Cases ***

Create requirement specification

        testlink.Change Test Project
        testlink.Go to Requirement Specification (mainframe)
        testlink.Create New Requirement Specification (type URS)
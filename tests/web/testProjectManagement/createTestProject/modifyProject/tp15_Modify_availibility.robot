*** Settings ***
Documentation  A test case for changing the project availibility
Resource  ../../../../../resource/testlink.robot



*** Variables ***

${testprojectname}  Sasa
${testprojectprefix}  sasa

*** Test Cases ***

Change Project Availibility

    testlink.Login as admin correct






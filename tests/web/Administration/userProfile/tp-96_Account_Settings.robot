*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Teardown  Run keywords  testlink.Set Personal data in My Settings back
...            AND           testlink.Set Personal password in My Settings back
...            AND           Close browser


*** Variables ***

${ChangedName}  SomeChangedName
${EmptyName}
${EmptyEmailAdress}
${EmptyLastName}
${NewTestEmailAdress}  testemailadress@honzaknownothing.com
${NewTestLastName}     testLastName
${NewTestFirstName}    testFirstName
${NewTestPassword}     testPassword

*** Test Cases ***

Change password in MySettings

     testlink.Login as admin correct
     testlink.Validate settings fields
     testlink.Change Personal password in My Settings
     testlink.Input Personal data in settings






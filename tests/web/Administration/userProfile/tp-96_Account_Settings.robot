*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot

Test Teardown  Run keywords  testlink.Set Personal data back
...            AND           Close browser


*** Variables ***

${ChangedName}  SomeChangedName
${EmptyName}
${EmptyEmailAdress}
${EmptyLastName}
${NewTestEmailAdress}  testemailadress@honzaknownothing.com
${NewTestLastName}     testLastName
${NewTestFirstName}    testFirstName
*** Test Cases ***

Change password in MySettings

     testlink.Login as admin correct
     testlink.Validate settings fields
     testlink.Input Personal data in settings




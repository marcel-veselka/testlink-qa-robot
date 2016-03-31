*** Settings ***

Documentation  A test suite with a single test for creating a new Custom Field. This test has
...            a workflow that is created using keywords from the resource file.

Resource       ../../../../resource/testlink.robot
#Resource

#Test Teardown  Run keywords  testlink.Delete Test Plan Management
#...            AND           Close browser


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

     testlink.Change Password



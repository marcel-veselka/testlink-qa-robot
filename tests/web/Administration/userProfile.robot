*** Settings ***
Documentation  Test case 97 is checking correct/incorrect logging to the testlab.tesena.com/testlink.
...            Test case 96 is for editing MySettings(account settings).
...            Test case verifies the correct inputing of information to the fields.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot

Test Setup  Run keywords           Login as admin ${LOGIN} ${PASSWORD}

Test Teardown  Run keywords        Close all browsers


*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${ChangedName}                      SomeChangedName
${NewTestEmailAdress}               testemailadress@honzaknownothing.com
${NewTestLastName}                  testLastName
${NewTestFirstName}                 testFirstName
${NewTestPassword}                  testPassword
${newTestProjectName}               userProfile
${newTestProjectPrefix}             userProfile
${LOGIN1}                           lalala
${PASSWORD1}                        1534354
${LOGIN2}                           renat.kulalov
${PASSWORD2}
### jfndlfjkd
### flkd;fg;df
*** Test Cases ***

97 Login

    Login as admin ${LOGIN1} ${PASSWORD1}
    Check there is a warning about login
    Login as admin ${LOGIN2} ${PASSWORD2}
    Check that warning about empty field appears

96 Change password in MySettings

     Validate settings fields
     Change Password
     Input Data in Settings
     Set My Personal Data


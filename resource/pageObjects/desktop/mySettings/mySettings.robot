*** Settings ***

Documentation  This is the resource file containing all methods based on desktop page
Library        Selenium2Library


*** Variables ***

${Name}         renat
${LastName}     kulalov
${emailAdress}  renat.kulalov@tesena.com
${Password}     renat123
${inputFirstName}  firstName
${inputLastName}  lastName
${inputEmail}  emailAddress
${buttonSave}  Save
${textWarning}  Warning!!
${elementOldPassword}  oldpassword
${elementNewPassword}  newpassword
${elementNewPasswordCheck}  newpassword_check
${buttonChangePassword}  Change password
${textPasswordChanged}  Your password was changed succesfully



*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains element  xpath=//h1[text()="Account Settings"]
    wait until page contains element  xpath=//h2[text()="Personal data"]
    wait until page contains element  xpath=//h2[text()="Personal password"]
    wait until page contains element  xpath=//h2[text()="API interface"]
    wait until page contains element  xpath=//input[@value="Save"]
    wait until page contains element  xpath=//input[@value="Change password"]
    wait until page contains element  xpath=//input[@value="Generate a new key"]
    unselect frame

Set Personal data back to normal
    select frame  mainframe
    input text  ${inputFirstName}  ${Name}
    input text  ${inputLastName}   ${LastName}
    input text  ${inputEmail}  ${emailAdress}
    click button    ${buttonSave}
    wait until page contains  Personal data changed
    unselect frame

Check Email field must be filled
    execute javascript  var imput = document.getElementsByName('emailAddress'); imput[0].required = false;
    click button  ${buttonSave}
    wait until page contains  ${textWarning}
    wait until page contains  OK
    click button    OK

Check Last Name field must be filled
    execute javascript  var imput = document.getElementsByName('lastName'); imput[0].required = false;
    click button  ${buttonSave}
    wait until page contains  ${textWarning}
    wait until page contains  OK
    click button    OK

Input Data in Settings
    [Tags]  tp96
    select frame  mainframe
    input text  ${inputFirstName}  ${NewTestFirstName}
    input text  ${inputLastName}  ${NewTestLastName}
    input text  ${inputEmail}  ${NewTestEmailAdress}
    click button  ${buttonSave}
    wait until page contains  Personal data changed
    unselect frame

Validate
    select frame  mainframe
    clear element text  ${inputEmail}
    Check Email field must be filled
    unselect frame
    select frame  mainframe
    clear element text  ${inputFirstName}
    Check First Name field must be filled
    unselect frame
    select frame  mainframe
    clear element text  ${inputLastName}
    Check Last Name field must be filled
    unselect frame

Check First Name field must be filled
    execute javascript  var imput = document.getElementsByName('firstName'); imput[0].required = false;
    click button  ${buttonSave}
    wait until page contains  ${textWarning}
    wait until page contains  OK
    click button    OK

Change Password
    select frame  mainframe
    wait until page contains element  ${elementOldPassword}
    wait until page contains element  ${elementNewPassword}
    wait until page contains element  ${elementNewPasswordCheck}
    input text  ${elementOldPassword}  ${Password}
    input text  ${elementNewPassword}  ${NewTestPassword}
    input text  ${elementNewPasswordCheck}   ${NewTestPassword}
    click button  ${buttonChangePassword}
    unselect frame
    select frame  mainframe
    wait until page contains  ${textPasswordChanged}
    unselect frame

Change Password back
    select frame  mainframe
    input text  ${elementOldPassword}  ${NewTestPassword}
    input text  ${elementNewPassword}  ${Password}
    input text  ${elementNewPasswordCheck}   ${Password}
    click button  ${buttonChangePassword}
    wait until page contains  ${textPasswordChanged}
    unselect frame

Set My Personal Data
    mySettings.Set Personal data back to normal
    mySettings.Change Password back

Wait and Validate
    wait until keyword succeeds  1min  0  mySettings.I am here
    mySettings.Validate
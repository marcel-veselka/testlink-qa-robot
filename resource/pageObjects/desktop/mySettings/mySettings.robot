*** Settings ***

Documentation  This is the resource file containing all methods based on desktop page
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      chrome
${Name}         renat
${LastName}     kulalov
${emailAdress}  renat.kulalov@tesena.com
${Password}     renat123





*** Keywords ***

Set Personal data back to normal

    input text  firstName  ${Name}
    input text  lastName   ${LastName}
    input text  emailAddress  ${emailAdress}
    click button    Save
    wait until page contains  Personal data changed

First Name Empty

    input text  firstName  ${EmptyName}

Check Page
    select frame  mainframe
    wait until page contains  Personal data
    wait until page contains  Personal password

Email Adress Empty

    input text  emailAddress  ${EmptyEmailAdress}

Last Name Empty

    input text  lastName  ${EmptyLastName}

Click Save Button

    click button  Save
    wait until page contains  Personal data changed

Check Email field must be filled

    execute javascript  var imput = document.getElementsByName('emailAddress'); imput[0].required = false;
    click button  Save
    wait until page contains  Warning!!
    click button    OK

Input Email Adress

    input text  emailAddress  ${NewTestEmailAdress}

Check Last Name field must be filled

    execute javascript  var imput = document.getElementsByName('lastName'); imput[0].required = false;
    click button  Save
    wait until page contains  Warning!!
    click button    OK

Input Last Name

    input text  lastName  ${NewTestLastName}

Check First Name field must be filled

    execute javascript  var imput = document.getElementsByName('firstName'); imput[0].required = false;
    click button  Save
    wait until page contains  Warning!!
    click button    OK

Input First Name

    input text  firstName  ${NewTestFirstName}

Change Password

    input text  oldpassword  ${Password}
    input text  newpassword  ${NewTestPassword}
    input text  newpassword_check   ${NewTestPassword}
    click button  Change password
    wait until page contains  Your password was changed succesfully

Change Password back

    input text  oldpassword  ${NewTestPassword}
     input text  newpassword  ${Password}
    input text  newpassword_check   ${Password}
    click button  Change password
    wait until page contains  Your password was changed succesfully



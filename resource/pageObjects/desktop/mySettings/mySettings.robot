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
${projectTemplate}  testing project
${newTestProjectName}  testingProjectNew1
${newTestProjectPrefix}  prefixNew1


*** Keywords ***

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
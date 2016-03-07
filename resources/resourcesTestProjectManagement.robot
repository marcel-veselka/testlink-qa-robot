*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library
#zkuska

*** Variables ***
${LINKTOBLOCK}   lib/cfields/cfieldsView.php
${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php

*** Keywords ***
Open Browser To Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Capture Page Screenshot
    Title Should Be  TestLink

Login as Admin
    input text  login  renat.kulalov
    input text  tl_password  renat123

Submit Credentials
    Click Button  login_submit

Select desired frame
    select frame  name=mainframe

Click User Management
    click link  Test Project Management

Add Test Project Name
    input text  tprojectName  NTP

Add Prefix
    input text  tcasePrefix  NewPrefix

Select Create From Existing Projects = No
    select from list  copy_from_tproject_id  0

Create Test Project
    click button  create

Save Test Project
    click button  submit

Check if Test Project is created
    wait until page contains  NTP




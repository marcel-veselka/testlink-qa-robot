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
${BROWSER}      ff
${CFNAME}       CFN
${CFLABEL}      CFL

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

Wait a little
    Sleep  5

Select desired frame
    select frame  name=mainframe


Select Define Custom Fields
    click link   Define Custom Fields

Create new custom field
    Click Button  create_cfield

Input the name of the Custom Field
    input text  cf_name  ${CFNAME}

Input the label of the Custom Field
    input text  cf_label  ${CFLABEL}

Add new Custom Field
    Click Button  do_update

Check id new Custom Field is created
    sleep  5
    wait until page contains  ${CFLABEL}


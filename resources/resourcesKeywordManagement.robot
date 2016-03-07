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
${BROWSER}       ff
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

Wait a little
    Sleep  10

Choose Keyword Management
    click link  Keyword Management

Create Keyword
    click button  create_keyword

Enter the name for a keyword1
    input text  keyword  qwerty

Enter the name for a keyword2
    input text  keyword  qwerty2

Enter the name for a keyword3
    input text  keyword  qwerty3

Save Keyword
    click button  create_req

Check
    page should contain  Keyword Management

Check if Keyword1 is created
    wait until page contains  qwerty

Check if Keyword2 is created
    page should contain  qwerty2

Check if Keyword3 is created
    page should contain  qwerty3
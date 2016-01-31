*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

# ${SERVER}        p747.phpnet.org/testlink-demo
${SERVER}        testlab.tesena.com/testlink
${BROWSER}       firefox
${DELAY}         0
#${VALID USER}    demo
#${VALID PASSWD}  demo123
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

Go To Login Page
    Go To  ${LOGIN URL}
    Title Should Be  TestLink

Input Username  [Arguments]  ${username}
    Input Text  login  ${username}

Input Password  [Arguments]  ${password}
    Input Text  tl_password  ${password}

Submit Credentials
    Click Button  login_submit

Welcome Page Should Be Open
    Location Should Be  ${WELCOME URL}
    Page Should Contain Link link=Desktop
    Title Should Be  TestLink 1.9.11(The Robots of Dawn)

Login Should Have Failed
    Location Should Be  ${ERROR URL}
    Title Should Be  TestLink
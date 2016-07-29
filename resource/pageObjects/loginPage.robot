*** Settings ***

Documentation  This is the resource file containing all methods based on login page
Library        Selenium2Library
Library  OperatingSystem
Library  String


*** Variables ***

${SERVER}               testlab.tesena.com/testlink
${DELAY}                0
${LOGIN URL}            http://${SERVER}/login.php
${WELCOME URL}          http://${SERVER}/index.php?caller=login
${ERROR URL}            http://${SERVER}/login.php
${BROWSER}              ff
${elementLogin}         login
${loginSubmit}          login_submit
${indexPage}            xpath=//img[@title="logo"]
${elementPassword}      tl_password
${css}                  css=div.messages_rounded
${HOSTNAME}             home/travis/build/marcel-veselka/testlink-qa-robot/ip.txt


*** Keywords ***

Open Browser To Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Title Should Be  TestLink


Open Browser To Login Page TRAVIS
    ${TextFileContent}=    Get File  ip.txt
    Log    ${TextFileContent}
    ${ip}=	Get Line  ${TextFileContent}	0
    ${stripped}=	Strip String	${SPACE}${ip}${SPACE}
    open browser  http://${stripped}/testlink-code  ff
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Title Should Be  TestLink

Wait until page contains all elements for login
    wait until page contains element  ${elementLogin}
    wait until page contains element  ${elementPassword}
    wait until page contains element  ${loginSubmit}
    wait until page contains element  ${css}

I am here
    wait until page contains element  ${indexPage}
    wait until page contains element  ${elementLogin}
    wait until page contains element  ${elementPassword}
    wait until page contains element  ${loginSubmit}
    wait until page contains element  ${css}
    wait until page contains  New User?
    wait until page contains  Lost Password?
    wait until page contains  Home
    wait until page contains  GNU GPL

Fill credentials and submit ${LOGIN} ${PASSWORD}
    Fill Login ${LOGIN}
    Fill Password ${PASSWORD}
    Click Log in Button

Fill Login ${LOGIN}
    clear element text  ${elementLogin}
    input text  ${elementLogin}  ${LOGIN}

Fill Password ${PASSWORD}
    clear element text  ${elementPassword}
    input text  ${elementPassword}  ${PASSWORD}

Click Log in Button
    Click Button  ${loginSubmit}

Check that warning about empty field appears
    execute javascript  #var imput = document.getElementsByName('tl_login'); imput[0].required = false;
                   ...  var imput2 = document.getElementsByName('tl_password'); imput2[0].required = false;
    click button  ${loginSubmit}
    wait until page contains  Try again! Wrong login name or password!



Login as admin ${LOGIN} ${PASSWORD}
    loginPage.Open Browser To Login Page TRAVIS
    wait until keyword succeeds  1min  0  loginPage.Wait until page contains all elements for login
    Fill credentials and submit ${LOGIN} ${PASSWORD}



Check if Login was succesful
    Title Should Be  TestLink 1.9.14 (Padawan)

Check there is no warning about login
    page should not contain  Try again! Wrong login name or password!

Check there is a warning about login
    page should contain  Try again! Wrong login name or password!

*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      ff


*** Keywords ***

Check Test Project Management
    select frame  name=mainframe
    wait until page contains  Test Project Management
    wait until page contains element  search
    unselect frame

Create Empty Test Project
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Capture Page Screenshot
    Title Should Be  TestLink
    input text  login  renat.kulalov
    input text  tl_password  renat123
    Click Button  login_submit
    select frame  name=mainframe
    wait until page contains  Test Project Management
    click link  Test Project Management
    click button  create
    select from list  copy_from_tproject_id  0
    input text  tprojectName  ${testprojectname}
    input text  tcasePrefix  ${testprojectprefix}
    click button  name=doActionButton
    sleep  5
    wait until page contains  ${testprojectname}

Delete Test Project

    go to  ${WELCOME URL}
    select frame  name=mainframe
    wait until page contains  Test Plan Management
    click link  Test Plan Management
    page should contain  There are no Test Plans defined!
    go to  ${WELCOME URL}
    select frame  name=mainframe
    wait until page contains  Test Project Management
    click link  Test Project Management
    sleep  2
    click element  xpath=//tr[td//text()[contains(.,'${testprojectname}')]]/td[last()]
    sleep  1
    click button  Yes
    page should not contain  ${testprojectname}
    page should not contain  ${testprojectprefix}
    close browser


Selecet Created Test Project
   click element  xpath//*[@id="item_view"]/tbody/tr[2]/td[1]/a
   click element  xpath=//tr[td//text()[contains(.,'${testprojectname}')]]/td[1]
#Vojta
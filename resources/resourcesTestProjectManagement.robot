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
${testprojectname}  testproject32
${testprojectprefix}  testprefix32

#${BROWSER}  chrome

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

Click Test Plan Management
    wait until page contains  Test Plan Management
    click link  Test Plan Management

Click Test Project Management
    wait until page contains  Test Project Management
    click link  Test Project Management

Click Test Specification
    wait until page contains  Test Specification
    click link  Test Specification

Add Test Project Name
    input text  tprojectName  ${testprojectname}

Add Prefix
    input text  tcasePrefix  ${testprojectprefix}

Select Create From Existing Projects = No
    select from list  copy_from_tproject_id  0

Select Create From Existing Projects = Yes
    select from list  copy_from_tproject_id  681

Create Test Project
    click button  create

Save Test Project
    click button  name=doActionButton
    sleep  4


Check if Test Project is created
    wait until page contains  ${testprojectname}

#Check if Test Project is created
    #wait until element contains  id=item_view_wrapper  ${testprojectname}  2

No warnings
    page should not contain element  css=div.error

Unique prefix or name check
    element should not contain  id=item_view_wrapper  ${testprojectname}
    element should not contain  id=item_view_wrapper  ${testprojectprefix}

Unselect all features
    unselect checkbox  optReq
    unselect checkbox  optPriority
    unselect checkbox  optAutomation
    unselect checkbox  optInventory

Test plan set for project = no
    page should contain  There are no Test Plans defined!

Go to desktop
    go to  ${WELCOME URL}

Delete row with Test Project
    #click element  xpath=//tr[td//text()[contains(., '${testprojectname}')]]/td[last()]
    click element  xpath=//tr[td//text()[contains(., '${testprojectname}')]]/td[last()]/img[last()]
    sleep  1
    click button  Yes

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












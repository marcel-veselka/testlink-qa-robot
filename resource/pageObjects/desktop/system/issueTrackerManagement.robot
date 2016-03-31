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

Check Issue Tracker Management
    select frame  name=mainframe
    wait until page contains element  create
    unselect frame

Click Create Issue Tracker Management
    select frame  name=mainframe
    click button  create
    unselect frame

Check if warning message appears
    select frame  name=mainframe
    click button  create
    wait until page contains  Issue Tracker name cannot be empty!
    click button  ext-gen18
    unselect frame

Fill in all fields, type: BUGZILLA (XMLRPC)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  bugzilla (Interface: xmlrpc)
    click button  create
    unselect frame

Fill in all fields, type: BUGZILLA (DB)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER1}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  bugzilla (Interface: db)
    click button  create
    unselect frame

Fill in all fields, type: MANTIS (SOAP)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER2}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  mantis (Interface: soap)
    click button  create
    unselect frame

Fill in all fields, type: MANTIS (DB)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER3}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  mantis (Interface: db)
    click button  create
    unselect frame

Fill in all fields, type: JIRA (SOAP)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER4}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  jira (Interface: soap)
    click button  create
    unselect frame

Fill in all fields, type: JIRA (DB)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER5}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  jira (Interface: db)
    click button  create
    unselect frame

Fill in all fields, type: JIRA (REST)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER6}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  jira (Interface: rest)
    click button  create
    unselect frame

Fill in all fields, type: FOGBUGZ (DB)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER7}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  fogbugz (Interface: db)
    click button  create
    unselect frame

Fill in all fields, type: FOGBUGZ (REST)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER8}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  fogbugz (Interface: rest)
    click button  create
    unselect frame

Fill in all fields, type: YOUTRACK (REST)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER9}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  youtrack (Interface: rest)
    click button  create
    unselect frame

Fill in all fields, type: REDMINE (REST)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER10}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  redmine (Interface: rest)
    click button  create
    unselect frame

Fill in all fields, type: TRAC (XMLRPC)
    select frame  name=mainframe
    input text  name  ${ISSUETRACKER11}
    input text  cfg  ${CONFIGURATION}
    select from list by label  xpath=//*[@id="type"]  trac (Interface: xmlrpc)
    click button  create
    unselect frame

Check created issue trackers
    select frame  name=mainframe
    wait until page contains  ${ISSUETRACKER}
    wait until page contains  ${ISSUETRACKER1}
    wait until page contains  ${ISSUETRACKER2}
    wait until page contains  ${ISSUETRACKER3}
    wait until page contains  ${ISSUETRACKER4}
    wait until page contains  ${ISSUETRACKER5}
    wait until page contains  ${ISSUETRACKER6}
    wait until page contains  ${ISSUETRACKER7}
    wait until page contains  ${ISSUETRACKER8}
    wait until page contains  ${ISSUETRACKER9}
    wait until page contains  ${ISSUETRACKER10}
    wait until page contains  ${ISSUETRACKER11}
    unselect frame

Check Issue Tracker named ${ISSUETRACKER}
    select frame  name=mainframe
    wait until page contains  ${ISSUETRACKER}
    unselect frame

Delete Issue trackers
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER1}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER2}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER3}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER4}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER5}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER6}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER7}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER8}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER9}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER10}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER11}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame

Delete Issue tracker
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${ISSUETRACKER}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  name=mainframe
    wait until page does not contain  ${ISSUETRACKER}
    unselect frame



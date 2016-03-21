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
Go to desired frame
    select frame  mainframe

Click Test Project Management
    click link  Test Project Management

Wait until page contains all elements
    desktopPageJan.Go to desired frame
    wait until page contains  Test Project Management

Go to Define Custom Fields
    select frame  name=mainframe
    click link  Define Custom Fields
    unselect frame

Go to Issue Tracker Management
    select frame  name=mainframe
    click link  Issue Tracker Management
    unselect frame

Go to Test Project Management
    select frame  name=mainframe
    click link  Test Project Management
    unselect frame

Go to Assign User Roles
    select frame  name=mainframe
    click link  Assign User Roles
    unselect frame

Go to Assign Custom Fields
    select frame  name=mainframe
    click link  Assign Custom Fields
    unselect frame

Go to Keyword Management
    select frame  name=mainframe
    click link  Keyword Management
    unselect frame

Go to Platform Management
    select frame  name=mainframe
    click link  Platform Management
    unselect frame

Go to Requirement Specification (mainframe)
    select frame  name=mainframe
    click link  Requirement Specification
    unselect frame

Go to Requirement Overview
    select frame  name=mainframe
    click link  Requirement Overview
    unselect frame

Go to Search Requirements
    select frame  name=mainframe
    click link  Search Requirements
    unselect frame

Go to Search Requirement Specifications
    select frame  name=mainframe
    click link  Search Requirement Specifications
    unselect frame

Go to Assign Requirements
    select frame  name=mainframe
    click link  Assign Requirements
    unselect frame

go to Generate Requirement Specification Document
    select frame  name=mainframe
    click link  Generate Requirement Specification Document
    unselect frame

Go to Test Specification (mainframe)
    select frame  name=mainframe
    click link  Test Specification
    unselect frame

Go to Search Test Cases
    select frame  name=mainframe
    click link  Search Test Cases
    unselect frame

Go to Assign Keywords
    select frame  name=mainframe
    click link  Assign Keywords
    unselect frame

Go to Test Cases Created Per User
    select frame  name=mainframe
    click link  Test Cases created per User
    unselect frame

Check Current Project
    select frame  name=mainframe
    page should not contain  Execute Tests
    unselect frame

Check New Project
    select frame  name=mainframe
    wait until page contains  Execute Tests
    unselect frame

Check info
    select frame  name=mainframe
    click element  xpath=/html/body/div[1]/div[1]/img
    wait until page contains element  tlhelp
    unselect frame
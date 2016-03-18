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
{@projectTemplate}  testing project
{@newTestProjectName}  testingProjectNew1
{@newTestProjectPrefix}  prefixNew1


*** Keywords ***

Click Test Project Management
    click link  Test Project Management

Wait until page contains all elements
    page should contain link  Test Project Management

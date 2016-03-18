*** Settings ***

Documentation  This is the resource file containing all methods based on test project management page
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
Click create
    click button  create

Wait until page contains all elements
    wait until page contains element  create

Project Exist
    page should contain element  xpath=//tr[contains(td, ${newTestProjectName})]

Delete existing project
    click element  xpath=//tr[td//text()[contains(.,'${newTestProjectName}')]]/td[last()]
    sleep  1
    click button  Yes
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


Check Platform Management
    select frame  name=mainframe
    wait until page contains  Platform Management
    wait until page contains element  create_platform
    unselect frame


Check Platform Management Without Platforms
    select frame  name=mainframe
    wait until page contains  Platform Management
    wait until page contains element  create_platform
    page should not contain element  xpath=/html/body/div/table
    unselect frame
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
Assign TC to platform ${PlatformName}
    select frame  mainframe
    select frame  workframe
    #click element  xpath=//tr[td/span//text()[contains(.,'${testCaseName}')]]/tr[td//text()[contains(.,'${PlatformName}')]]/td[input[@type="checkbox"]]/input
    select from list by value  select_platform  0
    click element  xpath=//*[@id="header-wrap"]/div[2]/div/button[1]
    click button  doAddRemove
    unselect frame

Show Test Cases
    select frame  mainframe
    select frame  treeframe
    click button  show_whole_test_spec
    unselect frame
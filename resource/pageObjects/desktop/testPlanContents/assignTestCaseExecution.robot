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
Select platform ${PlatformName}
    select frame  mainframe
    select frame  treeframe
    click element  xpath=//*[@id="settings"]/table/tbody/tr[2]/td[2]/div
    click element  xpath=//*[@id="settings"]/table/tbody/tr[2]/td[2]/select/option[.='${PlatformName}']
    unselect frame

Select User ${Username}
    select frame  mainframe
    select frame  workframe
    click element  xpath//*[@id="tester_for_tcid_12218_18_chosen"]/ul/li/input
    click element  xpath=//*[@id="tester_for_tcid_12218_18"]/option[.='${Username}']
    click button  doActionButton
    unselect frame

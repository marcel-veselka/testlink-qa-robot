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
${dokumentID}   newdokumentid
${title}        newtitle


*** Keywords ***

Select Test Suite
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=filter_testcase_name
    wait until page contains element  name=doUpdateTree
    input text  name=filter_testcase_name  ${title}
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    page should contain element  xpath=//a[span[contains(text(),"${title} (")]]
    click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  Requirements Specification Document
    unselect frame




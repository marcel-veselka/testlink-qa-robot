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


Check Assign Keywords
    select frame  name=mainframe
    wait until page contains element  workframe
    select frame  name=workframe
    wait until page contains  Keyword Assignment
    unselect frame

Create Keyword
    select frame  mainframe
    wait until page contains element  name=create_keyword
    click element  name=create_keyword
    unselect frame
    select frame  mainframe
    wait until page contains element  name=create_req
    wait until page contains element  name=keyword
    input text  keyword  ${KeywordName}
    click element  create_req
    unselect frame

Check Keyword Was Created
    select frame  mainframe
    wait until page contains element  xpath=//div/table/tbody/tr/td/a[contains(text(),"${KeywordName}")]
    page should contain element  xpath=//div/table/tbody/tr/td/a[contains(text(),"${KeywordName}")]
    unselect frame

Click Assign Keyword to Test Case
    select frame  mainframe
    wait until page contains element  name=keyword_assign
    click element  keyword_assign
    unselect frame

Assign Keywords
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=/html/body/div/div/form/div/table/tbody/tr/td[2]/img[1]
    wait until page contains element  name=assigntestcase
    wait until page contains element  name=from_select_box
    click element  xpath=/html/body/div/div/form/div/table/tbody/tr/td[2]/img[1]
    click element  assigntestcase
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//div/div/p[contains(text(),"item")][contains(text()," ")][contains(text(),"was successfully")][contains(text()," ")][contains(text(),"updated!")]
    page should contain element  xpath=//div/div/p[contains(text(),"item")][contains(text()," ")][contains(text(),"was successfully")][contains(text()," ")][contains(text(),"updated!")]
    unselect frame

Check Keyword
    select frame  mainframe
    wait until page contains element  xpath=//table[//tbody/tr[contains(.,"${KeywordName}")]]
    unselect frame
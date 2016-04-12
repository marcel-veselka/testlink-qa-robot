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

I am here
    select frame  name=mainframe
    select frame  name=treeframe
    wait until page contains element  xpath=//h1[text()="Execute Tests"]
    wait until page contains element  xpath=//span[contains(text(),"Settings")]
    wait until page contains element  xpath=//span[contains(text(),"Filters")]
    wait until page contains element  xpath=//input[@value="Apply"]
    wait until page contains element  xpath=//input[@value="Reset Filters"]
    wait until page contains element  xpath=//input[@value="Advanced Filters"]
    wait until page contains element  xpath=//input[@value="Expand tree"]
    wait until page contains element  xpath=//input[@value="Collapse tree"]
    wait until page contains element  tree_div
    unselect frame

Execute Test Case
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/textarea[@style="resize:both;"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div[@class="resultBox"]
    wait until page contains element  xpath=//div/form/div/table/tbody/tr/td/div/input[@type="submit"]
    input text  xpath=//div/form/div/table/tbody/tr/td/textarea[@style="resize:both;"]  New Description
    select from list by value  xpath=//div/form/div/table/tbody/tr/td/div/select  p
    input text  execution_duration  1010
    click element  xpath=//div/form/div/table/tbody/tr/td/div/input[@type="submit"]
    wait until page contains element  xpath=//div/form/div/div[contains(text(),"Build")][contains(text(),"${buildName}")]
    page should contain element  xpath=//div/form/div/div[contains(text(),"Build")][contains(text(),"${buildName}")]
    unselect frame


*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${elementTCID}              TCID
${buttonDoSearch}           doSearch
${textSearchTC}             Search Test Cases
${textTCID}                 Test Case ID
${textTitle}                Title
${elementTitle}             name

*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains  ${textSearchTC}
    wait until page contains element  ${buttonDoSearch}
    wait until page contains element  ${elementTCID}
    wait until page contains  ${textTCID}
    wait until page contains  ${textTitle}
    wait until page contains element  ${elementTitle}
    unselect frame

Search TC by ${element} ${text}
    select frame  mainframe
    input text  ${element}  ${text}
    click element  ${buttonDoSearch}
    unselect frame

Check TC ${testCaseName} was selected
    select frame  mainframe
    wait until page contains element  tl_table_test_case_search_target
    wait until page contains element  xpath=//div/div[contains(., "${testCaseName}")][a/img[@title="Execution history"]]
    page should contain element  xpath=//div/div[contains(., "${testCaseName}")][a/img[@title="Execution history"]]
    unselect frame



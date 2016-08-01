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



*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains  ${textSearchTC}
    wait until page contains element  ${buttonDoSearch}
    wait until page contains element  ${elementTCID}
    wait until page contains  ${textTCID}
    wait until page contains  ${textTitle}
    unselect frame

Search TC by ${element} ${text}
    select frame  mainframe
    input text  ${element}  ${text}
    click element  ${buttonDoSearch}
    unselect frame

Click dropdown Keyword ${Keyword}
    select frame  mainframe
    click element  xpath=//*[@id="ext-gen3"]/div[1]/form/table/tbody/tr[8]/td[2]/select
    click element  xpath=//*[@id="ext-gen3"]/div[1]/form/table/tbody/tr[8]/td[2]/select/option[.='${Keyword}']
    click element  ${buttonDoSearch}
    unselect frame

Check TC ${testCaseName} was selected
    select frame  mainframe
    wait until page contains element  tl_table_test_case_search_target
    wait until page contains element  xpath=//div/div[contains(., "${testCaseName}")][a/img[@title="Execution history"]]
    page should contain element  xpath=//div/div[contains(., "${testCaseName}")][a/img[@title="Execution history"]]
    unselect frame



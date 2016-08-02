*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${elementCreateKeyword}             create_keyword
${elementCreateReq}                 create_req
${inputKeyword}                     keyword
${elementKeywordAssign}             keyword_assign
${xpathImage}                       xpath=/html/body/div/div/form/div/table/tbody/tr/td[2]/img[2]
${xpathUpdated}                     xpath=//div/div/p[contains(text(),"item")][contains(text()," ")][contains(text(),"was successfully")][contains(text()," ")][contains(text(),"updated!")]
${elementAssignTC}                  assigntestcase
${elementFromSelectBox}             from_select_box

*** Keywords ***

Create Keyword
    select frame  mainframe
    wait until page contains element  ${elementCreateKeyword}
    click element  ${elementCreateKeyword}
    unselect frame
    select frame  mainframe
    wait until page contains element  ${elementCreateReq}
    wait until page contains element  ${inputKeyword}
    input text  ${inputKeyword}  ${KeywordName}
    click element  ${elementCreateReq}
    unselect frame

Check Keyword Was Created
    select frame  mainframe
    wait until page contains element  xpath=//div/table/tbody/tr/td/a[contains(text(),"${KeywordName}")]
    page should contain element  xpath=//div/table/tbody/tr/td/a[contains(text(),"${KeywordName}")]
    unselect frame

Click Assign Keyword to Test Case
    select frame  mainframe
    wait until page contains element  ${elementKeywordAssign}
    click element  ${elementKeywordAssign}
    unselect frame

Assign Keywords single arrow and save
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathImage}
    wait until page contains element  ${elementAssignTC}
    wait until page contains element  ${elementFromSelectBox}
    click element  xpath=//*[@id="from_select_box-0"]
    click element  ${xpathImage}
    click element  ${elementAssignTC}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathUpdated}
    page should contain element  ${xpathUpdated}
    unselect frame

Assign Keywords
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathImage}
    wait until page contains element  ${elementAssignTC}
    wait until page contains element  ${elementFromSelectBox}
    click element  ${xpathImage}
    click element  ${elementAssignTC}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathUpdated}
    page should contain element  ${xpathUpdated}
    unselect frame

Check Keyword
    select frame  mainframe
    wait until page contains element  xpath=//table[//tbody/tr[contains(.,"${KeywordName}")]]
    unselect frame
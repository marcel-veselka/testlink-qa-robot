*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library

*** Variables ***
${keywordName}  keywordtest

*** Keywords ***

Creating Keyword Management
    keywordManagement.Check Keyword Management
    keywordManagement.Click Create keyword
    keywordManagement.Input information about keyword
    keywordManagement.Check keyword

Check Keyword Management
    select frame  mainframe
    wait until page contains  Keyword Management
    unselect frame

Click Create keyword
    select frame  mainframe
    click element  xpath=//*[@id="create_keyword"]
    unselect frame

Input information about keyword
    select frame  mainframe
    input text  keyword  ${keywordName}
    input text  notes  descriptiontest
    click element  create_req
    unselect frame

Check keyword
    select frame  mainframe
    page should contain  ${keywordName}
    unselect frame

New ${KeywordName} Delete
    select frame  mainframe
    wait until page contains  ${KeywordName}
    page should contain  ${KeywordName}
    unselect frame
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${KeywordName}')]]/td[last()]
    unselect frame
    select frame  mainframe
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  mainframe
    page should not contain  xpath=//tr[td//text()[contains(.,'${KeywordName}')]]
    unselect frame
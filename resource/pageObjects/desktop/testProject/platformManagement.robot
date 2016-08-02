*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

*** Keywords ***

Check Platform Management Without Platforms
    select frame  mainframe
    wait until page contains  Platform Management
    wait until page contains element  create_platform
    page should not contain element  xpath=/html/body/div/table
    unselect frame

Create Platform ${PlatformName}
    select frame  titlebar
    click element  xpath=//img[@title="logo"]
    unselect frame
    select frame  mainframe
    wait until page contains  Platform Management
    click link  Platform Management
    unselect frame
    select frame  mainframe
    click button  create_platform
    unselect frame
    select frame  mainframe
    input text  name    ${PlatformName}
    click button  submitButton
    unselect frame
    select frame  mainframe
    wait until page contains  ${PlatformName}
    unselect frame


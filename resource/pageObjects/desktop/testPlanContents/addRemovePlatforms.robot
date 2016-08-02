*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${elementDoAssignPlatforms}             doAssignPlatforms
${tableAssignedAvailablePlatforms}      xpath=//tr[td[contains(.,"Available platforms")]][td[contains(.,"Assigned platforms")]]
${tableAvailablePlatforms}              xpath=//td[contains(.,"Avaliable platforms")]//option
${tableAssignedPlatforms}               xpath=//td[contains(.,"Assigned platforms")]//option

*** Keywords ***

Check there are no platforms assigned
    select frame  mainframe
    page should contain element  xpath=//tr[td[contains(.,"Available platforms")]][//option[contains(.,"${PlatformName}")]]
    page should not contain element  ${tableAssignedPlatforms}
    unselect frame

I Am Here
    select frame  mainframe
    wait until page contains element  xpath=//div[contains(.,"Add / Remove Platforms to Test Plan: ${TestPlanName}")]
    wait until page contains element  ${elementDoAssignPlatforms}
    wait until page contains element  ${tableAssignedAvailablePlatforms}
    unselect frame

Check there is platform assigned
    select frame  mainframe
    page should contain element  xpath=//td[contains(.,"Assigned platforms")][//option[contains(.,"${PlatformName}")]]
    page should not contain element  ${tableAvailablePlatforms}
    unselect frame

Add Platforms
    select frame  mainframe
    click element  xpath=//tr/td[2]/img[1]
    click button  ${elementDoAssignPlatforms}
    wait until page contains element  xpath=//*[@id="to_select_box"]/option[2]
    unselect frame

Add single Platform
    select frame  mainframe
    wait until page contains element  xpath=//tr/td[2]/img[2]
    click element  xpath=//*[@id="from_select_box"]/option[1]
    click element  xpath=//tr/td[2]/img[2]
    click button  ${elementDoAssignPlatforms}
    wait until page contains element  xpath=//*[@id="to_select_box"]/option[1]
    unselect frame
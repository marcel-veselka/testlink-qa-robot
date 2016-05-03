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

Check there are no platforms assigned
    select frame  mainframe
    page should contain element  xpath=//tr[td[contains(.,"Available platforms")]][//option[contains(.,"${PlatformName}")]]
    page should not contain element  xpath=//td[contains(.,"Assigned platforms")]//option
    unselect frame

I Am Here
    select frame  mainframe
    wait until page contains element  xpath=//div[contains(.,"Add / Remove Platforms to Test Plan: ${TestPlanName}")]
    wait until page contains element  doAssignPlatforms
    wait until page contains element  xpath=//tr[td[contains(.,"Available platforms")]][td[contains(.,"Assigned platforms")]]
    unselect frame

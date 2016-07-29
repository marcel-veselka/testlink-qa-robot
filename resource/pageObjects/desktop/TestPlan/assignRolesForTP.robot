*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${doUpdateButton}               xpath=//input[@name="do_update"]
${automationTesterList}         xpath=//tr[td[contains(text(), "automation.tester")]]//td/select
${testerTesenaList}             xpath=//tr[td[contains(text(), "tester (tester tesena)")]]//td/select
${nameList}                     xpath=//tr[td[contains(text(), "vojta.svoboda")]]//td/select
${assignTestPlanText}           Assign Test Plan roles
${usedRolesText}                User Roles updated

*** Keywords ***

I am here ASSIGN ROLES
    select frame  mainframe
    wait until page contains  ${assignTestPlanText}
    wait until page contains element  ${doUpdateButton}
    wait until page contains element  ${automationTesterList}
    wait until page contains element  ${testerTesenaList}
    wait until page contains element  ${nameList}
    unselect frame

Assign Roles for TP
    wait until keyword succeeds  1min  0  assignRolesForTP.I am here ASSIGN ROLES
    select frame  mainframe
    select from list by value  ${automationTesterList}  9
    select from list by value  ${testerTesenaList}  7
    select from list by value  ${nameList}  6
    click element  ${doUpdateButton}
    unselect frame
    select frame  mainframe
    wait until page contains  ${usedRolesText}
    page should contain  ${usedRolesText}
    unselect frame

Check That Roles Were Chnanged
    wait until keyword succeeds  1min  0  assignRolesForTP.I am here ASSIGN ROLES
    select frame  mainframe
    list selection should be  ${automationTesterList}  9
    list selection should be  ${testerTesenaList}  7
    list selection should be  ${nameList}  6
    unselect frame


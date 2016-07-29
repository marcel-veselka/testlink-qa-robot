*** Settings ***
Documentation  Settings for creating testing data for all test suites.


Resource       ../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../resource/helper/desktopHeaderSystem.robot
Resource       ../../resource/helper/desktopHeaderSpecification.robot
Resource       ../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../resource/helper/desktopHeaderHelper.robot

*** Variables ***

${LOGIN}                            admin
${PASSWORD}                         admin

*** Test Cases ***

Login as admin default
    loginPage.Open Browser To Login Page TRAVIS
    wait until keyword succeeds  1min  0  loginPage.Wait until page contains all elements for login
    Fill credentials and submit ${LOGIN} ${PASSWORD}

Create new user
    HeaderPage Go to ${indexPage}
    HeaderPage Go to ${userManagement}


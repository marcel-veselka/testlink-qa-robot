*** Settings ***
Documentation  Settings for creating testing data for all test suites.


Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderSystem.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot
Resource       ../../../resource/helper/desktopHeaderPlanContent.robot
Resource       ../../../resource/helper/desktopHeaderHelper.robot

*** Variables ***

${LOGIN}                            admin
${PASSWORD}                         admin

*** Test Cases ***

Login as admin default

Create new user


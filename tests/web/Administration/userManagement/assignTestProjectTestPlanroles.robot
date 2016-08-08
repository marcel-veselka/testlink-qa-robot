*** Settings ***
Documentation  Test Suite controls assigning roles to existing users, editing of the user.
...            Test Case tp100 Create new user is used for creating new user.
...            In testlnik the user created cannot be easily deleted.
...            Due to this fact tp100 is commented and will be used by testers if only needed.


Resource       ../../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot


Suite Setup  Run keywords        Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND              Create New Test Plan ${TestPlanName}
...             AND              Create and check role ${role} in user management


Suite Teardown  Run keywords     HeaderPage Go to ${userManagement}
...             AND              Delete role ${role}
...             AND              Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND              Close all browsers


*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${TestPlanName}                     testPlan
${TestPlanDescription}              Description
${user}                             vojta.svoboda
${fname}                            karel
${lname}                            karel
${email}                            email@email.com
${pass}                             vojta123
${role}                             novaRole
${newTestProjectName}               assignTestProject
${newTestProjectPrefix}             role


*** Test Cases ***

102 Assign project and roles

    HeaderPage Go to ${userManagement}
    Click bookmark Assign Test Project roles
    Change user role in test project
    Click Bookmark Assign Test Plan roles
    Change user role in test plan
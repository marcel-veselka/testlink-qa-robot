*** Settings ***
Documentation  Test Suite controls assigning roles to existing users, editing of the user.
...            Test Case tp100 Create new user is used for creating new user.
...            In testlnik the user created cannot be easily deleted.
...            Due to this fact tp100 is commented and will be used by testers if only needed.


Resource       ../../../../resource/helper/desktopHeaderTestProjectSettings.robot


Suite Setup  Run keywords        Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords     Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND              Close all browsers


*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${user}                             vojta.svoboda
${fname}                            karel
${lname}                            karel
${email}                            email@email.com
${pass}                             vojta123
${role}                             novaRole
${newTestProjectName}               newUser
${newTestProjectPrefix}             newUser
${TestPlanName}                     testPlan
${TestPlanDescription}              Description

*** Test Cases ***

#100 Create new user
    #Start creating new user
    #Fill all info about user and submit
    #Check that user exists

101 Edit user test case

    Start editing user
    Edit user
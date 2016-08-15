*** Settings ***

Documentation  Test Suite with several Test Cases, that are used to control creating test suite only with name
...            and detail information, renaming it and  deleting. Another test case controls moving function
...            of EMPTY and NOT EMPTY test suites via DRAG & DROP.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot

Suite Setup  Run keywords       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             Close Browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               testSuite
${newTestProjectPrefix}             management
${newTestProjectDescription}        Description
${testSuiteName1}                   tsuite88
${suiteDescription}                 Description
${testDescription}                  testDescription
${testSuiteName2}                   tsuite81
${testSuiteName3}                   tsuite81_1
${testSuiteName4}                   tsuite82
${testSuiteName5}                   tsuite82_1
${testSuiteName6}                   tsuite82_2
${testSuiteName7}                   tsuite82_3
${testSuiteName8}                   tsuite84
${testSuiteName9}                   tsuite124
${testCaseName1}                    tc82
${testCaseName2}                    tc82_1
${blank}
${KeywordName}                      KeyWordNew
${TestPlanName}                     testPlan
${TestPlanDescription}              DescriptionOfTestPlan
${buildName}                        buildName
${buildDescription}                 DescriptionOfBuild

*** Test Cases ***

80 Create Test Suite Easy

    Controll Warning Message And Create Test Suite ${testSuiteName1} ${suiteDescription}
    Check If Test Suite Was Created ${testSuiteName1}

81 Edit Test Suite 'Easy'

    Preconditions for tc80
    Leave fileds blanked ${blank}, rename ${testSuiteName3} test suite ${testSuiteName2}

82 Drag drop

    Preconditions for tc82
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Move suite ${testSuiteName4} to suite ${testSuiteName7}
    testSpecificationPage.Move suite ${testSuiteName5} to suite ${testSuiteName7}
    testSpecificationPage.Move suite ${testSuiteName6} to suite ${testSuiteName7}
    wait until keyword succeeds  1min  0  Check this testcase structure after movement

84 Delete Test Suite

    Preconditions for tc84
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    Delete New Test Suite ${testSuiteName8}

124 Move or Copy test Suite

    Preconditions for tc124
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    Test Suite ${testSuiteName9} select node
    Copy Test Suite ${testSuiteName9}

*** Keywords ***

Preconditions for tc124
    Create test suite ${testSuiteName9} in test project ${newTestProjectName}

Preconditions for tc80
    Create test suite ${testSuiteName2} in test project ${newTestProjectName}

Preconditions for tc82
    Create New Test Plan ${TestPlanName}
    Create Build with name ${buildName}
    Create test suite ${testSuiteName4} in test project ${newTestProjectName}
    Create test suite ${testSuiteName5} in test project ${newTestProjectName}
    Create test suite ${testSuiteName6} in test project ${newTestProjectName}
    Create test suite ${testSuiteName7} in test project ${newTestProjectName}
    Create test case ${testCaseName1} in ${testSuiteName5}
    Create test case ${testCaseName2} in ${testSuiteName6}
    Add Test Case ${testCaseName1} To the Test Plan ${TestPlanName}
    Execute Test ${testCaseName1}
    Keywords ${testCaseName2}

Preconditions for tc84
    Create test suite ${testSuiteName8} in test project ${newTestProjectName}

Check this testcase structure after movement
    Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${testSuiteName4}
    wait until page contains  ${testSuiteName5}
    wait until page contains  ${testSuiteName6}
    wait until page contains  ${testSuiteName7}
    wait until page contains  ${testCaseName1}
    wait until page contains  ${testCaseName2}
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName7}")]/ul/li[contains(.,"${testSuiteName4}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName7}")]/ul/li[contains(.,"${testSuiteName5}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName7}")]/ul/li[contains(.,"${testSuiteName6}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName7}")]/ul/li[contains(.,"${testSuiteName5}")]/ul/li[contains(.,"${testCaseName1}")]
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName7}")]/ul/li[contains(.,"${testSuiteName6}")]/ul/li[contains(.,"${testCaseName2}")]
    unselect frame
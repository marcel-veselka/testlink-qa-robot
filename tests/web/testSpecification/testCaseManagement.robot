*** Settings ***

Documentation  This Test Suite with Test Cases is used to control creating a test case with steps
...            without generation errors or conflicts, editing test cases, deleting of test case
...            with steps and keywords.Another test case checks Test case operations like:
...            Export, Print,Create a new version, Deactivate this version, Add to Test plan, Execution history.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot

Suite Setup  Run keywords    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND          Create New Test Plan ${TestPlanName}
...             AND          Create Build with name ${buildName}
...             AND          Create test suite ${testSuiteName} in test project ${newTestProjectName}

Suite Teardown  Run keywords     Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND              Close browser


*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${newTestProjectName}               createTestCase
${newTestProjectPrefix}             testCase
${TestPlanName}                     testPlan
${TestPlanDescription}              DescriptionOfTestPlan
${buildName}                        buildName
${buildDescription}                 DescriptionOfBuild
${testSuiteName}                    testsuite
${testDescription}                  testDescription
${testCaseName}                     tc86
${testCaseName1}                    tc87
${testCaseName2}                    tc89
${testCaseName3}                    tc89_1
${testCaseName4}                    tc89_2
${testCaseName5}                    tc90
${testCaseName6}                    tc90_1
${KeywordName}                      keyword


*** Test Cases ***

86 Create Test Case

    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    Test Suite ${testSuiteName} select node
    Click Test Case Button
    Fill informations test case ${testCaseName} and create
    Create Step in test case: ${testCaseName}
    Add Step after created first step

87 Edit test case

    Preconditions for tc87
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Select test case ${testCaseName1} node and click action button
    Edit Test Case ${testCaseName1}

89 Delete test case

    Preconditions for tc89
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Select test case ${testCaseName2} node and click action button
    Delete Test Case ${testCaseName2}
    Select test case ${testCaseName3} node and click action button
    Delete Test Case ${testCaseName3}
    testSpecificationPage.Select test case ${testCaseName4} node
    Delete Test Step

###  Test case operations: Print, Create a new version, Deactivate this version, ###
  ###  Add to Test plan, Execution history  ###
90 Test Case Operations

    Preconditions for tc90
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Create New Sibling ${testCaseName6} For ${testCaseName5}
    Check All Actions Buttons For Test Case ${testCaseName6}
    Add Test Case ${testCaseName6} To the Test Plan ${TestPlanName}
    Execute Test ${testCaseName6}
    Show Execution History ${testCaseName6}

*** Keywords ***

Preconditions for tc87
   Create test case ${testCaseName1} in ${testSuiteName}

Preconditions for tc89
    Create test case ${testCaseName2} in ${testSuiteName}
    Create test case ${testCaseName3} in ${testSuiteName}
    Create test case ${testCaseName4} in ${testSuiteName}
    Add Test Case ${testCaseName2} To the Test Plan ${TestPlanName}
    Execute Test ${testCaseName2}
    Keywords ${testCaseName2}

Preconditions for tc90
    Create test case ${testCaseName5} in ${testSuiteName}

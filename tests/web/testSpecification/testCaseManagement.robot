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
${testCaseName2}                    tc87_1
${testCaseName3}                    tc89
${testCaseName4}                    tc89_1
${testCaseName5}                    tc89_2
${testCaseName6}                    tc90
${testCaseName7}                    tc90_1
${KeywordName}                      keyword
${blank}
${newText}                          NewStepAction


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
    Leave fields blanked for TC and check control warning message
    Edit TC's ${testCaseName2} name, preconditions, keywords
    Edit Step ${newText} of Test Case ${testCaseName2}
    Use Resequence Step Button ${testCaseName2}
    Delete Keyword ${KeywordName}

89 Delete test case

    Preconditions for tc89
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Select test case ${testCaseName3} node and click action button
    Delete Test Case ${testCaseName3}
    Select test case ${testCaseName4} node and click action button
    Delete Test Case ${testCaseName4}
    Select test case ${testCaseName5} node
    Delete Test Step

###  Test case operations: Print, Create a new version, Deactivate this version, ###
###  Add to Test plan, Execution history   ###
90 Test Case Operations

    Preconditions for tc90
    Change Test Project and go to ${testSpecification} ${checkTestSpecification}
    Create New Sibling ${testCaseName7} For ${testCaseName6}
    Check All Actions Buttons For Test Case ${testCaseName7}
    Add Test Case ${testCaseName7} To the Test Plan ${TestPlanName}
    Execute Test ${testCaseName7}
    Show Execution History ${testCaseName7}

*** Keywords ***

Preconditions for tc87
   Create test case ${testCaseName1} in ${testSuiteName}
   Create New Keyword

Preconditions for tc89
    Create test case ${testCaseName3} in ${testSuiteName}
    Create test case ${testCaseName4} in ${testSuiteName}
    Create test case ${testCaseName5} in ${testSuiteName}
    Add Test Case ${testCaseName3} To the Test Plan ${TestPlanName}
    Execute Test ${testCaseName3}
    Keywords ${testCaseName4}

Preconditions for tc90
    Create test case ${testCaseName6} in ${testSuiteName}

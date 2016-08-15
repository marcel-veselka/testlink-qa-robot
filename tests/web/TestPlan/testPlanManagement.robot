*** Settings ***

Documentation  The test suite with several test cases for checking basic functions for editing, creating and deleting Test Plan.
...            Several Test Cases controls creating Test plan with unique information,
...            creating using the "create as copy" feature, creating using the "create as copy" feature
...            with all checkboxes "unchecked".

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot
Resource       ../../../resource/helper/desktopHeaderSpecification.robot
Resource       ../../../resource/helper/desktopHeaderPlanContent.robot

Suite Setup                      Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}


Suite Teardown  Run keywords    Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND             close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           TestPlanCreate
${newTestProjectPrefix}         TestCreate
${newTestProjectDescription}    DesctiptioneOfTestProject
${testSuiteName}                testSuite56
${testCaseName}                 tc56
${TestPlanName}                 testPlan53
${TestPlanName1}                testPlan54
${TestPlanName2}                testPlan54_1
${TestPlanName3}                testPlan55
${TestPlanName4}                testPlan55_1
${TestPlanName5}                testPlan56
${TestPlanName6}                testPlan56_1
${TestPlanName7}                testPlan59
${TestPlanName8}                testPlan60
${EditTestPlanName}             testPlan56_2
${TestPlanDescription}          DescriptionOfTestPlan
${PlatformName}                 Platform
${buildName}                    buildName
${buildDescription}             DescriptionOfBuild
${Username}                     renat.kulalov
${PlatformName1}                Platform56

*** Test Cases ***

53 Create new test plan
    ### Keyword contains filling name & description of Test Plan, ###
     ### selecting Active & Public options, clicking on "Create" button ###
    Create New Test Plan ${TestPlanName}

54 Create test plan AS COPY
    Create New Test Plan ${TestPlanName1}
    ### Keyword contains filling name & description of Test Plan, ###
     ### selecting Active & Public options, selecting a Test plan  ###
     ### you want to use as a template in 'Create from existing Test Plan' ###
     ### option, clicking on "Create" button ###
    Create Test Plan Management ${TestPlanName2} AS COPY ${TestPlanName1}

55 Create test plan AS COPY ALL OPTIONS UNCHECKED

    Create New Test Plan ${TestPlanName3}
    ### Keyword contains filling name & description of Test Plan, ###
     ### selecting Active & Public options, selecting a Test plan  ###
     ### you want to use as a template in 'Create from existing Test Plan' ###
     ### option, selecting all checkboxes, clicking on "Create" button ###
    Create Test Plan ${TestPlanName4} AS COPY Unselect all checkboxes ${TestPlanName3}

56 Edit and Order Test Plan

    Preconditions for tc56
    Order By Test Case, Name, Build, Platform In Test Plan Management ${TestPlanName5} ${TestPlanName6}
    Make all Test Plan Active/Inactive ${TestPlanName5} ${TestPlanName6}
    ### This method contains several functions, which control leaving Test Plan name and description blank ###
    ### editing of Test Plan ###
    Edit And Check Test Plan ${TestPlanName6} ${EditTestPlanName}

59 Assign Roles

    Create New Test Plan ${TestPlanName7}
    Assign Roles ${TestPlanName7}
    Check That Roles Were Assigned ${TestPlanName7}

60 Delete Test Plan

    Preconditions fro tc60
    Delete Test Plan Management  ${TestPlanName8}

*** Keywords ***

Preconditions for tc56
    Create New Test Plan ${TestPlanName5}
    Create New Test Plan ${TestPlanName6}
    Create Build with name ${buildName}
    Create Platform ${PlatformName1}
    Add single Platform to Test Plan
    Create test suite ${testSuiteName} in test project ${newTestProjectName}
    Create test case ${testCaseName} in ${testSuiteName}
    Add Test Case ${testCaseName} To the Test Plan ${TestPlanName5}

Preconditions fro tc60
    Create New Test Plan ${TestPlanName8}




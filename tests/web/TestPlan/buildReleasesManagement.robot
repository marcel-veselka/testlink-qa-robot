*** Settings ***

Documentation  This Test Suite with several Test Cases is used for creating build with values without/with release date
...            and that could not generate error/conflicts while creating. Another Test Cases creates build from another
...            existing build(No conflicts). Also there is a Test Case, that controls editing mode for Build.

Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot

Suite Setup  Run keywords    Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND          Create New Test Plan ${TestPlanName}

Suite Teardown  Run keywords  Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...            AND            Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           buildManagement
${newTestProjectPrefix}         build
${buildName}                    buildName61
${buildName1}                   buildName62
${buildName2}                   buildName63
${buildName3}                   buildName63_1
${buildName4}                   buildName64
${buildName5}                   buildName64_1
${buildName6}                   buildName64_2
${buildName7}                   buildName66
${buildDescription}             DescriptionOfBuild
${TestPlanName}                 testPlan
${TestPlanDescription}          DescriptionOfTestPlan

*** Test Cases ***

61 Create Build - "Easy" - No release date
    Change Test Project and go to ${buildReleases} ${checkBuildReleases}
    Start creating build
    Add Details and Finish creating build ${buildName}
    Check if Build was created ${buildName}

62 Create Build - "EASY" - With Release Date

    Go to index page and change testproject
    Start creating build with warning
    Create Build With Release Date And Save ${buildName1}
    Check if Build was created ${buildName1}

63 Create Build - "Easy" - from existing build

    Create Build with name ${buildName2}
    Go to index page and change testproject
    Create ${buildName3} from existing ${buildName2}

64 Edit Build

    Preconditions for tc64
    Change Test Project and go to ${buildReleases} ${checkBuildReleases}
    Select Build ${buildName4}
    Edit Build Info and Save Changes ${buildName6}
    Check if Build was created ${buildName6}

66 Delete Build
### This Keyword contains differnet methods for choosing certain ###
### build and deleting it by accepting warning message ###
    Preconditions for tc66
    Delete build ${buildName7}

*** Keywords ***

Preconditions for tc64
    Create Build with name ${buildName4}
    Create Build with name ${buildName5}

Preconditions for tc66
    Create Build with name ${buildName7}

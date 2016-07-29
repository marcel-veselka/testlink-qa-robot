*** Settings ***
Library  Selenium2Library

Resource  ../../resource/helper/desktopHeaderHelper.robot
Resource  ../../resource/pageObjects/desktop/TestPlan/testPlanManagement.robot
Resource  ../../resource/pageObjects/desktop/TestPlan/assignRolesForTP.robot
Resource  ../../resource/pageObjects/desktop/TestPlan/testPlanManagement_detail.robot
Resource  ../../resource/pageObjects/desktop/TestPlan/buildsReleases.robot

*** Variables ***

*** Keywords ***

Start creating build
    [Tags]  tp63
    Change Test Project and go to ${buildReleases} ${checkBuildReleases}
    buildsReleases.Create Build

Start creating build with warning
    [Tags]  tp61
    Change Test Project and go to ${buildReleases} ${checkBuildReleases}
    buildsReleases.Create Build
    buildsReleases.Check if warning message appears

Create ${NewNameBuild} from existing ${FromBuild}
    [Tags]  tp63
    Start creating build
    buildsReleases.Fill info and choose template ${NewNameBuild} ${FromBuild}

Delete Build ${buildName}
    [Tags]  tp61
    Change Test Project and go to ${buildReleases} ${checkBuildReleases}
    buildsReleases.Delete ${buildName} Build

Create New Test Plan ${TestPlanName}
    Change Test Project and go to ${testPlanManagement} ${testPlanManagement}
    testPlanManagement.Create Test Plan Management
    testPlanManagement_detail.Fill in all fields ${TestPlanName}
    wait until keyword succeeds  1min  0  testPlanManagement.Check Test Plan Management is Created ${TestPlanName}

Create Test Plan Management ${TestPlanName} AS COPY ${TestPlanName1}
     [Tags]  tp54
    Change Test Project and go to ${testPlanManagement} ${testPlanManagement}
    testPlanManagement.Create Test Plan Management
    testPlanManagement_detail.Create Test Plan ${TestPlanName} with Warning Message ${TestPlanName1}
    testPlanManagement.Check Test Plan Management is Created ${TestPlanName}

Create Test Plan ${TestPlanName} AS COPY Unselect all checkboxes ${TestPlanName1}
    [Tags]  tp55
    Change Test Project and go to ${testPlanManagement} ${testPlanManagement}
    testPlanManagement.Create Test Plan Management
    testPlanManagement_detail.Create Test Plan ${TestPlanName} with unselected checkboxes ${TestPlanName1}
    testPlanManagement.Check Test Plan Management is Created ${TestPlanName}

Order By Test Case, Name, Build, Pltaform In Test Plan Management ${TestPlanName} ${TestPlanName1}
    [Tags]  56
    Change Test Project and go to ${testPlanManagement} ${testPlanManagement}
    testPlanManagement_detail.Order by Name, TC, Build, Platform ${TestPlanName} ${TestPlanName1}

Assign Roles ${TestPlanName}
    [Tags]  tp59
    Change Test Project and go to ${testPlanManagement} ${testPlanManagement}
    testPlanManagement_detail.Click Button Assign Roles Test Plan Management  ${TestPlanName}
    assignRolesForTP.Assign Roles for TP

Check That Roles Were Assigned ${TestPlanName}
    [Tags]  tp59
    Change Test Project and go to ${testPlanManagement} ${testPlanManagement}
    testPlanManagement_detail.Click Button Assign Roles Test Plan Management  ${TestPlanName}
    assignRolesForTP.Check That Roles Were Chnanged

Delete Test Plan Management
     [Arguments]  ${TestPlanNameToDelete}
     Change Test Project and go to ${testPlanManagement} ${testPlanManagement}
     testPlanManagement_detail.Delete and Check ${TestPlanNameToDelete}

Create Build with name ${buildName}
    [Tags]  tp63
    Change Test Project and go to ${buildReleases} ${checkBuildReleases}
    Start creating build
    Add Details and Finish creating build ${buildName}
    Check if Build was created ${buildName}
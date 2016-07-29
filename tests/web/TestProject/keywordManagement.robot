*** Settings ***
Documentation  Documentation will be provided

Resource       ../../../resource/helper/desktopHeaderSystem.robot
Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot

Suite Setup  Run keywords         Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND               Create New Test Plan ${TestPlanName}

#Suite Teardown  Run keywords      Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
#...             AND               Close browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${CFNAME}                           DEFCUS
${CFLABEL}                          FIELD
${CFNAME}                           DEFCUS
${NEWCFNAME}                        DEFCUSEDITED
${CFLABEL}                          FIELDEDITED
${newTestProjectName}               KeywordManagement
${newTestProjectPrefix}             custom
${newTestProjectDescription}        Test suite customFieldManagement: tp105, tp 106
${TestPlanName}                     testPlanforKM
${KeywordManagement}                Keyword Management
${checkKeywordManagement}           Keyword Management
${TestPlanDescription}              TestPlanDescription


*** Test Cases ***

Delete Keyword

     Start creating Keyword Management
     Change Test Project and go to ${KeywordManagement} ${checkKeywordManagement}
##### click assign keyword and continue



*** Keywords ***

Select and delete Custom Field

    select frame  name=mainframe
    click link  ${CFNAME}
    click button  do_delete
    wait until page contains  Yes
    click button  Yes
    unselect frame


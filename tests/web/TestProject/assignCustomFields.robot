*** Settings ***
Documentation  This test is about to 1. delete custom field 2. assign and delete custom field



Resource       ../../../resource/helper/desktopHeaderSystem.robot
Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../resource/helper/desktopHeaderTestPlan.robot

Suite Setup  Run keywords         Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}
...             AND               Create New Test Plan ${TestPlanName}

Suite Teardown  Run keywords      Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND               Close browser

*** Variables ***

${LOGIN}                            renat.kulalov
${PASSWORD}                         renat123
${CFNAME}                           DEFCUS
${CFLABEL}                          FIELD
${CFNAME}                           DEFCUS
${NEWCFNAME}                        DEFCUSEDITED
${CFLABEL}                          FIELDEDITED
${newTestProjectName}               customFieldManagement
${newTestProjectPrefix}             custom
${newTestProjectDescription}        Test suite customFieldManagement: tp105, tp 106
${TestPlanName}                     testPlanforCF
${TestPlanDescription}              testPlandescriptionforCF

*** Test Cases ***

126 Delete CF

    Start creating Define Custom Fields
    Change Test Project and go to ${AssignCustomFields} ${checkAssignCustomFields}
    Delete CF ${CFNAME}
    Start creating Define Custom Fields
    Assing and check custom field
    Delete CF ${CFNAME}


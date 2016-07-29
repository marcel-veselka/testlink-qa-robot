*** Settings ***
Documentation  This test suite is used to check deleting and editing of Custom Fields in TestLink.

Resource       ../../../resource/helper/desktopHeaderSystem.robot
Resource       ../../../resource/helper/desktopHeaderTestProjectSettings.robot

Suite Setup                       Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

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

*** Test Cases ***

105 Create new Custom Field

    Start creating Define Custom Fields
    Delete Custom Field ${CFNAME}

106 Create edit and delete new Custom Field

    Start creating Define Custom Fields
    Edit information Custom Field and Check New Custom Field
    Delete Custom Field ${NEWCFNAME}



*** Settings ***
Documentation  Test Suite with Test Cases that controls creating of new requirement specification, editing this
...            requirement and creating test case related to the reauirement operation.

Resource       ../../../../resource/helper/desktopHeaderTestProjectSettings.robot
Resource       ../../../../resource/helper/desktopHeaderSpecification.robot

Suite Setup  Run keywords   Login and Create new Test Project ${newTestProjectName} ${newTestProjectPrefix}

Suite Teardown  Run keywords     Delete test project  ${newTestProjectName}  ${newTestProjectPrefix}
...             AND              Close browser

*** Variables ***

${LOGIN}                        renat.kulalov
${PASSWORD}                     renat123
${newTestProjectName}           manualManagement
${newTestProjectPrefix}         manual
${dokumentID}                   newdokument38
${title}                        newtitle38
${dokumentID1}                  newdokument40
${title1}                       newtitle40
${dokumentID2}                  newdokument41
${title2}                       newtitle41
${dokumentID3}                   newdokumentid44
${title3}                        newtitle44

*** Test Cases ***

38 Create requirement specification

    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    ### Keyword contains filling in valid ID & title, selecting type of requirement ###
    Create New Requirement Specification (type URS) ${dokumentID} ${title}

41 Create requirement specification

    Preconditions for tc41
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create Test Case From Requirement ${dokumentID2} ${title2}
    Check Test Specification ${title2}

40 Modify requirement
    [Tags]  40
    Preconditions for tc40
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Choose Requirement Specification ${dokumentID1} ${title1}
    Create Requirement Operations ${dokumentID1} ${title1}
    ### This nethod is used to contol editing of requirement operations. It contains several nethods ###
    ### that checks leave Document ID and Title blank, leaving Document ID blank, fill in Title ${title} ###
    ### filling in Document ID ${dokumentID}, leaving Title field blank. At the end it checks editing ###
    ### status and type of chosen requirement. All the changes are saved. ###
    Edit Requirement Operations ${dokumentID1} ${title1}

44 Delete Requirement
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID3} ${title3}
    Choose Requirement Specification ${dokumentID3} ${title3}
    Create Requirement Operations ${dokumentID3} ${title3}
    Create New Version Of Requirement ${dokumentID3} ${title3}
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Choose Requirement Specification ${dokumentID3} ${title3}
    Delete Requirement Specification NO
    Select More Than 1 Version Requirement ${dokumentID3} ${title3}
    Delete More Than 1 Version Requirement ${dokumentID3} ${title3}
    Check Requirement Version ${dokumentID3} ${title3}

*** Keywords ***

Preconditions for tc40
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID1} ${title1}
    Choose Requirement Specification ${dokumentID1} ${title1}

Preconditions for tc41
    Change Test Project and go to ${requirmSpecification} ${checkRequirmSpecification}
    Create New Requirement Specification (type URS) ${dokumentID2} ${title2}
    Choose Requirement Specification ${dokumentID2} ${title2}
    Create Requirement Operations ${dokumentID2} ${title2}
    Choose Requirement Specification ${dokumentID2} ${title2}
    Create Requirement Operations ${dokumentID2} ${title2}
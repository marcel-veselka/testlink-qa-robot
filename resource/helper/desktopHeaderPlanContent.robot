*** Settings ***

Library  Selenium2Library

Resource  ../../resource/helper/desktopHeaderHelper.robot
Resource  ../../resource/pageObjects/desktop/testPlanContents/addRemoveTestCases.robot
Resource  ../../resource/pageObjects/desktop/testPlanContents/assignTestCaseExecution.robot
Resource  ../../resource/pageObjects/desktop/testPlanContents/updateLinkedTcVersion.robot
Resource  ../../resource/pageObjects/desktop/testPlanContents/addRemovePlatforms.robot

*** Variables ***

*** Keywords ***

Update linked TC ${testCaseName} ${testSuiteName} version
    [Tags]  tp78
    Change Test Project and go to ${updateTCVersion} ${updateTCVersion}
    updateLinkedTcVersion.Update New Version of Test Case

Check TC Version was changed ${testCaseName} ${testSuiteName} in Update Linked TC Version
    [Tags]  tp78
    Change Test Project and go to ${updateTCVersion} ${updateTCVersion}
    updateLinkedTcVersion.UpdateLinkedTcVersion Check TC Was Changed

Add single Platform to Test Plan
    [Tags]  tp130
    Change Test Project and go to ${addRemovePlatforms} ${addRemovePlatforms}
    addRemovePlatforms.Add single Platform

Add Platform to Test Plan
    [Tags]  tp130
    Change Test Project and go to ${addRemovePlatforms} ${addRemovePlatforms}
    addRemovePlatforms.Add Platforms

Check There Is No Platforms Assigned
    [Tags]  tp19
    Change Test Project and go to ${addRemovePlatforms} ${addRemovePlatforms}
    wait until keyword succeeds  1min  0  addRemovePlatforms.I Am Here
    addRemovePlatforms.Check there are no platforms assigned

Add TC ${testCaseName} to platform ${PlatformName} users ${Username}
    [Tags]  tp74
    Change Test Project and go to ${addRemoveTestCases} ${checkAddRemoveTestCases}
    addRemoveTestCases.Assign to user ${Username} & platform ${PlatformName} TC

Unassign TC ${PlatformName}
    [Tags]  tp74
    Change Test Project and go to ${addRemoveTestCases} ${checkAddRemoveTestCases}
    addRemoveTestCases.Unassign platform and its testCases ${PlatformName}

Check TC Version was changed ${testCaseName} ${testSuiteName} in Assign TC Execution
    [Tags]  tp78
    Change Test Project and go to ${assignTCExecution} ${assignTCExecution}
    assignTestCaseExecution.AssignTCExecution Check TC Was Changed

Check Assigned TC to ${Username} and ${PlatformName}
    [Tags]  tp74
    Change Test Project and go to ${assignTCExecution} ${assignTCExecution}
    assignTestCaseExecution.AssignTCExecution Check TC Was Corrected

Check TC Are Not Assigned ${testSuiteName}
    [Tags]  tp74
    Change Test Project and go to ${assignTCExecution} ${assignTCExecution}
    wait until keyword succeeds  1min  0  assignTestCaseExecution.I am here
    wait until keyword succeeds  1min  0  assignTestCaseExecution.Check there is no assigned TC ${testSuiteName}

*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.

Library        Selenium2Library


*** Variables ***

${xpathInputDoAddRemove}                xpath=//input[@name="doAddRemove"]
${elementTesterID}                      testerID
${elementCreateStep}                    create_step
${xpathCKEContentsSteps}                xpath=//*[@id="cke_contents_steps"]/iframe
${xpathCKEContentsExpectedResult}       xpath=//*[@id="cke_contents_expected_results"]/iframe
${xpathCKEContentsSummary}              xpath=//*[@id="cke_contents_summary"]/iframe
${xpathCKEContentsPreconditions}        xpath=//*[@id="cke_contents_preconditions"]/iframe
${textStepAction}                       StepAction
${elementStepActions}                   Step actions
${elementExpectedResult}                Expected Results
${textExpectedResult}                   Expect.Results
${elementDoUpdateStep}                  do_update_step
${elementDoUpdateStep&Exit}             do_update_step_and_exit
${textStepNumber}                       Step number:
${xpathInputBody}                       xpath=//body
${blank}
${elementSelectPlatform}                select_platform
${xpathButtonAdd}                       xpath=//button[contains(text(),"adding")]
${xpathTestSpecDesign}                  xpath=//img[@title="Test Spec Design"]
${textWarningExecutedTC}                Warning! This Test Case version has been executed.
${actionsButton}                        xpath=//img[@title="Actions"]
${elementEditTC}                        edit_tc
${elementTCStatus}                      tc_status
${elementImportance}                    importance
${elementExecutionHistory}              xpath=//img[@title="Execution history"]

*** Keywords ***

Check Page Add/Remove TC ${PlatformName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathInputDoAddRemove}
    wait until page contains element  xpath=//tbody[tr/td[contains(text(),"${PlatformName}")]]
    wait until page contains element  ${elementTesterID}
    unselect frame

Assign TC to user ${Username}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementTesterID}
    click element  ${elementTesterID}
    select from list by label  ${elementTesterID}  ${Username}
    unselect frame

Assign TC to platform ${PlatformName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  xpath=//tr[td[text()="${PlatformName}"]]//input[1]
    click element  ${xpathInputDoAddRemove}
    unselect frame

Check TC were Assigned
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tr[td[text()="${PlatformName}"]]//input[@type="checkbox"]
    wait until page contains element  xpath=//tr[td[text()="${PlatformName1}"]]//input[@type="checkbox"]
    unselect frame

Show Test Cases
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    click button  show_whole_test_spec
    unselect frame

Unassign TC from ${PlatformName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  xpath=//tr[td[text()="${PlatformName}"]]//input[@type="checkbox"]
    click element  ${xpathInputDoAddRemove}
    unselect frame

Assign to user ${Username} & platform ${PlatformName} TC
    addRemoveTestCases.Show Test Cases
    wait until keyword succeeds  1min  0  addRemoveTestCases.Check Page Add/Remove TC ${PlatformName}
    addRemoveTestCases.Assign TC to user ${Username}
    addRemoveTestCases.Assign TC to platform ${PlatformName}

Unassign platform and its testCases ${PlatformName}
    addRemoveTestCases.Show Test Cases
    wait until keyword succeeds  1min  0  addRemoveTestCases.Check Page Add/Remove TC ${PlatformName}
    addRemoveTestCases.Check TC were Assigned
    addRemoveTestCases.Unassign TC from ${PlatformName}

Assign All TC to Platform ${PlatformName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementSelectPlatform}
    wait until page contains element  ${xpathButtonAdd}
    select from list by label  ${elementSelectPlatform}  ${PlatformName}
    click element  ${xpathButtonAdd}
    click element  ${xpathInputDoAddRemove}
    unselect frame

Design Test Case ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${testCaseName}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathTestSpecDesign}
    click element  ${xpathTestSpecDesign}
    unselect frame

Change Window To The Edition Mode
    Select Window  TestLink
    maximize browser window
    wait until page contains  ${testCaseName}
    wait until page contains  ${textWarningExecutedTC}
    page should contain  ${textWarningExecutedTC}

Test Spec Design Edit ${testCaseName} Test Case
    Open Test Spec Design Edit
    Change Status And Importance in Test Spec Design Edit
    Add Step in Test Spec Design Edit

Open Test Spec Design Edit
    wait until page contains element  ${actionsButton}
    click element  ${actionsButton}
    wait until page contains element  ${elementEditTC}
    wait until page contains  ${testCaseName}
    click element  ${elementEditTC}

Add Step in Test Spec Design Edit
    wait until page contains element  ${elementCreateStep}
    click element  ${elementCreateStep}
    wait until page contains  ${elementStepActions}
    wait until page contains element  ${xpathCKEContentsSteps}
    mouse down  ${xpathCKEContentsSteps}
    mouse up  ${xpathCKEContentsSteps}
    select frame  ${xpathCKEContentsSteps}
    input text  ${xpathInputBody}  ${blank}
    unselect frame
    wait until page contains  ${elementExpectedResult}
    wait until page contains element  ${xpathCKEContentsExpectedResult}
    mouse down  ${xpathCKEContentsExpectedResult}
    mouse up  ${xpathCKEContentsExpectedResult}
    select frame  ${xpathCKEContentsExpectedResult}
    input text  ${xpathInputBody}  ${blank}
    unselect frame
    click button  ${elementDoUpdateStep}
    wait until page contains  ${textStepNumber}
    close window

Change Status And Importance in Test Spec Design Edit
    wait until page contains  Status
    wait until page contains  Importance
    wait until page contains element  ${elementTCStatus}
    wait until page contains element  ${elementImportance}
    wait until page contains element  do_update
    select from list by value  ${elementTCStatus}   7
    select from list by value  ${elementImportance}  3
    click element  do_update
    wait until page contains  Final
    wait until page contains  High

Execution History ${testCaseName} Open Window
    Select Window  TestLink 1.9.14 (Padawan)
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${testCaseName}
    wait until page contains element  ${elementExecutionHistory}
    click element  ${elementExecutionHistory}
    unselect frame
    Select window  TestLink
    maximize browser window
    wait until page contains  ${testCaseName}
    close window
    Select Window  TestLink 1.9.14 (Padawan)



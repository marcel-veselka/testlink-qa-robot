*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${elementTreeDiv}                       tree_div
${elementFilterTCByName}                filter_testcase_name
${elementDoUpdateTree}                  doUpdateTree
${elementExpandTree}                    expand_tree
${elementImageActions}                  xpath=//img[@title="Actions"]
${elementDeleteTestSuite}               delete_testsuite
${elementNewTestSuite}                  new_testsuite
${elementContainerName}                 container_name
${elementAddTestSuiteButton}            add_testsuite_button
${elementck8}                           cke_8
${xpathCkeTextarea}                     xpath=//*[@id="cke_contents_details"]/textarea
${xpathButtonOK}                        xpath=//button[text()="OK"]
${elementEditTestSuite}                 edit_testsuite
${elementUpdateTestSuite}               edit_testsuite
${xpathRichTextEditor}                  xpath=//iframe[@title="Rich text editor, details"]
${xpathInputBody}                       xpath=//body
${elementMoveTSViewer}                  move_testsuite_viewer
${xpathContainerChosen}                 xpath=//*[@id="containerID_chosen"]
${elementDoCopy}                        do_copy
${xpathDivB}                            xpath=//div/b
${xpathChosenResults}                   xpath=//ul[@class="chosen-results"]/li[2]
${elementCreateTC}                      create_tc
${elementName}                          name
${elementTCName}                        testcase_name
${elementDoCreateButton}                do_create_button
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
${elementCollapseTree}                  collapse_tree
${xpathArrow}                           xpath=//*[@id="extdd-1"]/img[1]
${elementNewTC}                         new_tc
${elementTCPrinterFriendly}             tcPrinterFriendly
${elementDoCreateNewVersion}            do_create_new_version
${xpathSuccessfullyCreated}             xpath=//div/p[contains(text(),"was successfully created" )]
${xpathdeactivateTCVersion}             deactivate_this_tcversion
${xpathInactiveVersion}                 xpath=//div/div[contains(text(),"This version is INACTIVE" )]
${elementActivateVersion}               activate_this_tcversion
${elementExecutionHistoryButton}        xpath=//div/div/span/input[@type="button"]
${elementDeleteTC}                      delete_tc
${elementDoDelete}                      do_delete
${xpathDeleteIT}                        xpath=//div/p[contains(text(),"Really delete Test Case?")]
${xpathStepRowImage}                    xpath=//*[@id="step_row_1"]/td[5]/img
${xpathStepRow2}                        xpath=//*[@id="step_row_2"]
${xpathStepRow1}                        xpath=//*[@id="step_row_1"]
${xpathDoToogleCF}                      xpath=//input[@id="doToggleCF"]
${buttonResequence}                     resequence_steps
${xpathStepRow1}                        xpath=//tr[@id="step_row_1"]
${xpathStepRow2}                        xpath=//tr[@id="step_row_2"]
${xpathStepRow3}                        xpath=//tr[@id="step_row_3"]

*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//h1[text()="Navigator - Test Specification"]
    wait until page contains element  xpath=//span[contains(text(),"Settings")]
    wait until page contains element  xpath=//span[contains(text(),"Filters")]
    wait until page contains element  xpath=//input[@value="Apply"]
    wait until page contains element  xpath=//input[@value="Reset Filters"]
    wait until page contains element  xpath=//input[@value="Expand tree"]
    wait until page contains element  xpath=//input[@value="Collapse tree"]
    wait until page contains element  ${elementTreeDiv}
    unselect frame

Add Filters Test Case Title Test Specification ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementFilterTCByName}
    wait until page contains element  ${elementDoUpdateTree}
    input text  ${elementFilterTCByName}  ${title}
    click button  ${elementDoUpdateTree}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    click element  ${elementExpandTree}
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  The Test Case was generated from the assigned requirement "${title}"
    unselect frame

Delete Test Suite
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementFilterTCByName}
    wait until page contains element  ${elementDoUpdateTree}
    input text  ${elementFilterTCByName}  ${title}
    click button  ${elementDoUpdateTree}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${title}
    wait until page contains element  xpath=//a[span[contains(text(),"${title} (")]]
    click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementImageActions}
    click element  ${elementImageActions}
    wait until page contains element  ${elementDeleteTestSuite}
    click element  ${elementDeleteTestSuite}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementDeleteTestSuite}
    click button  ${elementDeleteTestSuite}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  The Test Suite was successfully deleted
    unselect frame

Delete New Test Suite ${testSuiteName}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementDoUpdateTree}
    click button  ${elementDoUpdateTree}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    click element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementImageActions}
    click element  ${elementImageActions}
    wait until page contains element  ${elementDeleteTestSuite}
    click element  ${elementDeleteTestSuite}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementDeleteTestSuite}
    click button  ${elementDeleteTestSuite}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  The Test Suite was successfully deleted
    unselect frame

Create Test Suite Button
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementImageActions}
    click element  ${elementImageActions}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementNewTestSuite}
    click element  ${elementNewTestSuite}
    unselect frame

Fill In The Fields ${testSuiteName} ${testDescription}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementContainerName}
    wait until page contains element  ${elementAddTestSuiteButton}
    wait until page contains element  ${elementck8}
    input text  ${elementContainerName}  ${testSuiteName}
    click element  ${elementck8}
    input text  ${xpathCkeTextarea}  ${testDescription}
    click element  ${elementAddTestSuiteButton}
    unselect frame

Controll Warning Message
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    execute javascript  document.getElementById('name').required = false;
    click button  Save
    wait until page contains  Please give a name to Test Suite
    wait until page contains element  ${xpathButtonOK}
    click element  ${xpathButtonOK}
    unselect frame

Check Warning Message TC title
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    execute javascript  document.getElementById('testcase_name').required = false;
    click button  Save
    wait until page contains  Please give a title to Test Case
    wait until page contains element  ${xpathButtonOK}
    click element  ${xpathButtonOK}
    unselect frame

Check If Test Suite Was Created ${testSuiteName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Test Suite created
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementDoUpdateTree}
    click button  ${elementDoUpdateTree}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    unselect frame

Create Another Test Suite For Move Or Copy
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span[contains(text(),"${newTestProjectName} (")]]
    double click element  xpath=//a[span[contains(text(),"${newTestProjectName} (")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementImageActions}
    click element  ${elementImageActions}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementNewTestSuite}
    click element  ${elementNewTestSuite}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementContainerName}
    wait until page contains element  ${elementAddTestSuiteButton}
    wait until page contains element  ${elementck8}
    input text  ${elementContainerName}  ${testSuiteCopy}
    click element  ${elementck8}
    input text  ${xpathCkeTextarea}  ${testDescriptionCopy}
    click element  ${elementAddTestSuiteButton}
    unselect frame

Edit Test Suite ${testSuiteName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click element  ${elementUpdateTestSuite}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementName}
    input text  ${elementName}   ${testSuiteName}
    unselect frame

Submit and check test suite ${testSuiteName} was changed
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  update_testsuite
    click element  update_testsuite
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName}")]/div/a
    page should contain element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName}")]/div/a
    unselect frame

Copy Test Suite ${suite2}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementImageActions}
    click element  ${elementImageActions}
    wait until page contains element  ${elementMoveTSViewer}
    click element  ${elementMoveTSViewer}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathContainerChosen}
    wait until page contains element  ${elementDoCopy}
    wait until page contains element  ${xpathDivB}
    click element  ${xpathDivB}
    wait until page contains  ${newTestProjectName}
    wait until page contains element  xpath=//ul[@class="chosen-results"]/li[text()="${newTestProjectName}"]
    click element  ${elementDoCopy}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//p[contains(text(),"Test Suite ${suite2}")][contains(text(),"has been copied inside")][contains(text(),"${newTestProjectName}")]
    unselect frame

Move Test Suite
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementImageActions}
    click element  ${elementImageActions}
    wait until page contains element  ${elementMoveTSViewer}
    click element  ${elementMoveTSViewer}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathContainerChosen}
    wait until page contains element  ${elementDoCopy}
    wait until page contains element  ${xpathDivB}
    click element  ${xpathDivB}
    wait until page contains  ${newTestProjectName}
    wait until page contains element  ${xpathChosenResults}
    click element  ${xpathChosenResults}
    click element  do_move
    unselect frame

Check Move And Copy Action ${suite2}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    click button  ${elementExpandTree}
    wait until element contains  ${elementTreeDiv}  ${suite2}
    wait until element contains  ${elementTreeDiv}  20
    xpath should match x times  //div/ul/li/ul/li/div/a/span[contains(.,"${suite2}")]  1
    xpath should match x times  //div/ul/li/ul/li/ul/li/div/a/span[contains(.,"${suite2}")]  1
    unselect frame

Click Test Case Button
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementImageActions}
    click element  ${elementImageActions}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementCreateTC}
    click element  ${elementCreateTC}
    unselect frame

Select test project ${newTestProjectName} node
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    click element  ${elementExpandTree}
    wait until page contains element  xpath=//a[contains(.,"${newTestProjectName} (")]
    double click element  xpath=//a[contains(.,"${newTestProjectName} (")]
    unselect frame

Click Actions button
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementImageActions}
    double click element  ${elementImageActions}
    unselect frame

Click new test suite
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementNewTestSuite}
    click element  ${elementNewTestSuite}
    unselect frame

Fill name for ts: ${testSuiteName} and submit
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementName}
    wait until page contains element  ${elementAddTestSuiteButton}
    input text  ${elementName}   ${testSuiteName}
    click element  ${elementAddTestSuiteButton}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Test Suite created
    unselect frame

Test Suite ${testSuiteName} select node
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until element contains  ${elementTreeDiv}  ${testSuiteName}
    wait until page contains element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName}")]/div/a
    click element  xpath=//ul/li/ul/li[contains(.,"${testSuiteName}")]/div/a
    unselect frame

Click new test case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementCreateTC}
    click element  ${elementCreateTC}
    unselect frame

Add keyword to TC
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//td/img[1]
    click element  xpath=//td/img[1]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//td[contains(.,"Assigned Keywords")][//option[contains(.,"${KeywordName}")]]
    page should contain element  xpath=//td[contains(.,"Assigned Keywords")][//option[contains(.,"${KeywordName}")]]
    unselect frame

Leave fields blanked for TC and check control warning message
    Start editing Test Case
    Edit Test Case ${blank}
    Check Warning Message TC title

Edit TC's ${testCaseName2} name, preconditions, keywords
    Edit Test Case ${testCaseName2}
    Add keyword to TC
    Save changes

Fill name for tc: ${testCaseName} and submit
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementTCName}
    wait until page contains element  ${elementDoCreateButton}
    input text  ${elementTCName}  ${testCaseName}
    click element  ${elementDoCreateButton}
    unselect frame

Choose Step
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//tr[@id="step_row_1"]//td[p[contains(.,"StepAction")]]
    click element  xpath=//tr[@id="step_row_1"]//td[p[contains(.,"StepAction")]]
    unselect frame

Edit Step with ${newText}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${elementStepActions}
    wait until page contains element  ${xpathCKEContentsSteps}
    mouse down  ${xpathCKEContentsSteps}
    mouse up  ${xpathCKEContentsSteps}
    select frame  ${xpathCKEContentsSteps}
    input text  ${xpathInputBody}  ${newText}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  ${elementDoUpdateStep&Exit}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${textStepNumber}
    unselect frame

Resequence Step Button
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${buttonResequence}
    wait until page contains element  ${xpathStepRow1}
    wait until page contains element  ${xpathStepRow2}
    wait until page contains element  ${xpathStepRow3}
    click element  xpath=//tr[@id="step_row_2"]//img[@title="Delete step"]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    page should not contain  ${xpathStepRow2}
    click element  ${buttonResequence}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathStepRow1}
    wait until page contains element  ${xpathStepRow2}
    page should contain element  ${xpathStepRow1}
    page should contain element  ${xpathStepRow2}
    page should not contain element  ${xpathStepRow3}
    unselect frame

Edit Step ${newText} of Test Case ${testCaseName}
    Select test case ${testCaseName} node
    Choose Step
    Edit Step with ${newText}
    Create Step

Create Step
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementCreateStep}
    click button  ${elementCreateStep}
    wait until page contains  ${elementStepActions}
    wait until page contains element  ${xpathCKEContentsSteps}
    mouse down  ${xpathCKEContentsSteps}
    mouse up  ${xpathCKEContentsSteps}
    select frame  ${xpathCKEContentsSteps}
    input text  ${xpathInputBody}  ${textStepAction}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${elementExpectedResult}
    wait until page contains element  ${xpathCKEContentsExpectedResult}
    mouse down  ${xpathCKEContentsExpectedResult}
    mouse up  ${xpathCKEContentsExpectedResult}
    select frame  ${xpathCKEContentsExpectedResult}
    input text  ${xpathInputBody}  ${textExpectedResult}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  ${elementDoUpdateStep}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${textStepNumber}
    unselect frame

Add Step after created first step
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${elementStepActions}
    wait until page contains element  ${xpathCKEContentsSteps}
    mouse down  ${xpathCKEContentsSteps}
    mouse up  ${xpathCKEContentsSteps}
    select frame  ${xpathCKEContentsSteps}
    input text  ${xpathInputBody}  ${textStepAction}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${elementExpectedResult}
    wait until page contains element  ${xpathCKEContentsExpectedResult}
    mouse down  ${xpathCKEContentsExpectedResult}
    mouse up  ${xpathCKEContentsExpectedResult}
    select frame  ${xpathCKEContentsExpectedResult}
    input text  ${xpathInputBody}  ${textExpectedResult}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  ${elementDoUpdateStep}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  ${textStepNumber}
    wait until page contains element  ${elementDoUpdateStep&Exit}
    wait until keyword succeeds  1min  0  testSpecificationPage.Click IT
    unselect frame

Click IT
    click button  ${elementDoUpdateStep&Exit}

Move suite ${from} to suite ${target}
    [Tags]  tp82
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${newTestProjectName}
    wait until page contains  ${from}
    wait until page contains  ${target}
    wait until page contains  ${newTestProjectPrefix}-1:${testCaseName1}
    wait until page contains  ${newTestProjectPrefix}-2:${testCaseName2}
    drag and drop  xpath=//ul/li/ul/li[contains(.,"${from}")]/div/img[2]  xpath=//ul/li/ul/li[contains(.,"${target}")]/div/img[2]
    unselect frame

Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    click element  ${elementExpandTree}
    unselect frame

Collapse tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementCollapseTree}
    click element  ${elementCollapseTree}
    unselect frame

Click on arrow to unfold
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until element is visible  ${xpathArrow}
    click element  ${xpathArrow}
    unselect frame

Check Collapse tree
    select frame  mainframe
    select frame  treeframe
    wait until page contains   ${newTestProjectName}
    wait until page contains element  ${xpathArrow}
    page should contain element  ${xpathArrow}
    page should not contain  ${testSuiteName}
    page should not contain  ${testSuiteName1}
    unselect frame

Check Expand tree
    select frame  mainframe
    page should contain element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=(//span[contains(text(),"${testSuiteName}")])[1]
    wait until page contains element  xpath=(//span[contains(text(),"${testSuiteName1}")])[1]
    wait until page contains element  xpath=(//span[contains(text(),"${newtestprojectprefix}-1:${testCaseName}")])[1]
    unselect frame

Fill in title test case name ${testCaseName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    input text  ${elementTCName}  ${testCaseName}
    unselect frame

Fill in Summary test case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Summary
    wait until page contains element  ${xpathCKEContentsSummary}
    mouse down  ${xpathCKEContentsSummary}
    mouse up  ${xpathCKEContentsSummary}
    select frame  ${xpathCKEContentsSummary}
    input text  ${xpathInputBody}  Summary
    unselect frame

Fill in Preconditions test case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Preconditions
    wait until page contains element  ${xpathCKEContentsPreconditions}
    mouse down  ${xpathCKEContentsPreconditions}
    mouse up  ${xpathCKEContentsPreconditions}
    select frame  ${xpathCKEContentsPreconditions}
    input text  ${xpathInputBody}  Preconditionsss
    unselect frame

Check create test case open
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Test Case Title
    wait until page contains  Summary
    wait until page contains  Preconditions
    unselect frame

Select test case ${testCaseName} node
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains  ${testCaseName}
    wait until page contains element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName}")]/div/a
    double click element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName}")]/div/a
    unselect frame

Generate new Sibling ${testCaseName2}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementNewTC}
    click element  ${elementNewTC}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementTCName}
    wait until page contains element  ${elementDoCreateButton}
    input text  ${elementTCName}  ${testCaseName2}
    click element  ${elementDoCreateButton}
    unselect frame

Check New Sibling Was Created ${testCaseName2}
    testSpecificationPage.Expand tree
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName2}")]/div/a
    page should contain element  xpath=//ul/li/ul/li/ul/li[contains(.,"${testCaseName2}")]/div/a
    unselect frame

Select test case ${testCaseName} node and click action button
    testSpecificationPage.Select test case ${testCaseName} node
    testSpecificationPage.Click Actions button

Click On Print View Test Case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementTCPrinterFriendly}
    click element  ${elementTCPrinterFriendly}
    unselect frame

Click On Create New Version
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementDoCreateNewVersion}
    click element  ${elementDoCreateNewVersion}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathSuccessfullyCreated}
    page should contain element  ${xpathSuccessfullyCreated}
    unselect frame

Click On Deactivate This Version
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathdeactivateTCVersion}
    click element  ${xpathdeactivateTCVersion}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathInactiveVersion}
    page should contain element  ${xpathInactiveVersion}
    unselect frame

Click On Activate This Version
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementActivateVersion}
    click element  ${elementActivateVersion}
    unselect frame

Click On Add To Test Plans ${TestPlanName}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  addToTestPlans
    click element  addToTestPlans
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  add2testplan
    wait until page contains element  xpath=//*[@id="item_view"]
    select checkbox  xpath=//tr[td[contains(.,"${TestPlanName}")]]//td/input
    click element  add2testplan
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//table[tbody[tr/td[contains(text(),"${TestPlanName}")]]]
    page should contain element  xpath=//table[tbody[tr/td[contains(text(),"${TestPlanName}")]]]
    unselect frame

Click On Execution History
    select frame  mainframe
    select frame  workframe
    wait until page contains element  ${elementExecutionHistoryButton}
    click element  ${elementExecutionHistoryButton}
    unselect frame

Edit Test Case ${testCaseNameEdit}
    testSpecificationPage.Fill in title test case name ${testCaseNameEdit}
    testSpecificationPage.Fill in Summary test case
    testSpecificationPage.Fill in Preconditions test case

Save changes
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  do_update
    unselect frame

Start editing Test Case
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  edit_tc
    unselect frame

Delete Test Case ${NameTestCase}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element   delete_tc
    click element   delete_tc
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementDoDelete}
    wait until page contains element  ${xpathDeleteIT}
    page should contain element  ${xpathDeleteIT}
    click button  ${elementDoDelete}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  was successfully deleted
    unselect frame

Delete Test Step
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathStepRowImage}
    click element  ${xpathStepRowImage}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains  Yes
    click button  Yes
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathStepRow2}
    page should not contain element  ${xpathStepRow1}
    unselect frame

Check Custom Fields
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${xpathDoToogleCF}
    page should contain element  ${xpathDoToogleCF}
    wait until page contains element  xpath=//table[tbody/tr/td[contains(.,"${CFLABEL}")]]
    page should contain element  xpath=//table[tbody/tr/td[contains(.,"${CFLABEL}")]]
    unselect frame

Navigator tree expands by one branch
     select frame  mainframe
     select frame  treeframe
     wait until page contains element  ${xpathArrow}
     wait until page contains   ${newTestProjectName}
     click element   ${xpathArrow}
     unselect frame

Click on black arrow
     select frame  mainframe
     select frame  treeframe
     wait until page contains element  ${xpathArrow}
     wait until page contains   ${newTestProjectName}
     wait until page contains    ${testSuiteName}
     wait until page contains    ${testSuiteName1}
     click element   ${xpathArrow}
     unselect frame

Control black arrow
     select frame  mainframe
     select frame  treeframe
     wait until page contains element  ${xpathArrow}
     wait until page contains   ${newTestProjectName}
     page should not contain   ${testSuiteName}
     page should not contain  ${testSuiteName1}
     unselect frame

Control white arrow
     select frame  mainframe
     select frame  treeframe
     wait until page contains element  ${xpathArrow}
     wait until page contains   ${newTestProjectName}
     page should contain  ${newTestProjectName}
     page should not contain  ${testSuiteName}
     page should not contain  ${testSuiteName1}
     unselect frame

Create TS ${testSuiteName} ${newTestProjectName}
    wait until keyword succeeds  1min  0  testSpecificationPage.I am here
    testSpecificationPage.Select test project ${newTestProjectName} node
    testSpecificationPage.Click Actions button
    testSpecificationPage.Click new test suite
    testSpecificationPage.Fill name for ts: ${testSuiteName} and submit

Create TC ${testSuiteName} in TS ${testCaseName}
    testSpecificationPage.I am here
    testSpecificationPage.Test Suite ${testSuiteName} select node
    testSpecificationPage.Click Actions button
    testSpecificationPage.Click new test case
    testSpecificationPage.Fill name for tc: ${testCaseName} and submit

Check White Arrow
    testSpecificationPage.Navigator tree expands by one branch
    testSpecificationPage.Control white arrow

Check Black Arrow
    testSpecificationPage.Click on black arrow
    testSpecificationPage.Control black arrow

Add TC to the Test Plan
    testSpecificationPage.Select test case ${testCaseName1} node and click action button
    testSpecificationPage.Click On Add To Test Plans ${TestPlanName}

Add Test Cases to the Test Plan
    testSpecificationPage.Select test case ${testCaseName2} node and click action button
    testSpecificationPage.Click On Add To Test Plans ${TestPlanName}
    testSpecificationPage.Select test case ${testCaseName3} node and click action button
    testSpecificationPage.Click On Add To Test Plans ${TestPlanName}
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Add To Test Plans ${TestPlanName}

Create New Version of TestCase ${testCaseName}
    testSpecificationPage.Select test case ${testCaseName} node and click action button
    testSpecificationPage.Click On Create New Version

Fill in the fields and create test suite
    testSpecificationPage.Create Test Suite Button
    testSpecificationPage.Fill In The Fields ${testSuiteName} ${testDescription}

Fill informations test case ${testCaseName} and create
    testSpecificationPage.Check create test case open
    testSpecificationPage.Fill in Summary test case
    testSpecificationPage.Fill in Preconditions test case
    testSpecificationPage.Fill name for tc: ${testCaseName} and submit

Create New Sibling ${testCaseNameNew} For ${testCaseName2}
    [Tags]  tp90
    testSpecificationPage.Select test case ${testCaseName2} node
    testSpecificationPage.Click Actions button
    testSpecificationPage.Generate new Sibling ${testCaseNameNew}
    testSpecificationPage.Check New Sibling Was Created ${testCaseNameNew}

Use Resequence Step Button ${testCaseName}
    testSpecificationPage.Select test case ${testCaseName} node
    testSpecificationPage.Resequence Step Button

*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${elementNewReqSpec}            new_req_spec
${elementTitle}                 title
${elementDocID}                 doc_id
${elementCreateSrs}             createSRS
${elementReqSpecType}           reqSpecType
${xpathActions}                 xpath=//img[@title="Actions"]
${elementCreateReq}             create_req
${elementReqTitle}              req_title
${elementReqDocID}              reqDocId
${elementReqType}               reqType
${elementReqStatus}             reqStatus
${elementExpandTree}            expand_tree
${elementEditReq}               edit_req
${inputExtGen30}                ext-gen30
${buttonCreateTC}               create_tcases
${elementCreateTCFormReq}       create_tc_from_req
${xpathCheckUncheck}            xpath=//tbody//img[@title="check/uncheck all"]
${elementCollapseTree}          collapse_tree
${elementDeleteReq}             delete_req
${elementFreezeReqVersion}      freeze_req_version
${elementCopyReq}               copy_req
${elementNewRevision}           new_revision
${elementNewButton}             new_version
${elementPrintFriendly}         printerFriendly
${elementDeleteSRS}             deleteSRS
${buttonDoUpdateTree}           doUpdateTree
${blank}
${buttonResetFilters}           btn_reset_filters

*** Keywords ***

Create New Requirement Specification (type URS) ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementNewReqSpec}
    click element  ${elementNewReqSpec}
    wait until page contains element  ${elementTitle}
    wait until page contains element  ${elementDocID}
    wait until page contains element  ${elementCreateSrs}
    wait until page contains element  ${elementReqSpecType}
    input text  ${elementDocID}  ${dokumentID}
    input text  ${elementTitle}  ${title}
    select from list by value  ${elementReqSpecType}  2
    click element  ${elementCreateSrs}
    unselect frame

Choose Requirement Specification ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    wait until keyword succeeds  1min  0  click element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathActions}
    unselect frame

Create Requirement Operations ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathActions}
    click element  ${xpathActions}
    wait until page contains element  ${elementCreateReq}
    click button  ${elementCreateReq}
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementCreateReq}
    wait until page contains element  ${elementReqTitle}
    wait until page contains element  ${elementReqDocID}
    wait until page contains element  ${elementReqType}
    wait until page contains element  ${elementReqStatus}
    input text  ${elementReqDocID}  ${dokumentID}
    input text  ${elementReqTitle}  ${title}
    select from list by value  ${elementReqStatus}  F
    select from list by value  ${elementReqType}  1
    click element  ${elementCreateReq}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    click element  ${elementExpandTree}
    wait until page contains  ${dokumentID}:${title}
    unselect frame

Change Requirement Status and Type ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    input text  ${elementReqDocID}  ${dokumentID}
    input text  ${elementReqTitle}  ${title}
    select from list by value  ${elementReqStatus}  I
    select from list by value  ${elementReqType}  6
    input text  expected_coverage  1
    click element  ${elementCreateReq}
    unselect frame

Fill the Log
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    #sleep  1
    wait until page contains  Revision Log
    wait until page contains  Please add a log message
    wait until page contains element  ${inputExtGen30}
    wait until keyword succeeds  1min  0  input text  ${inputExtGen30}  This is new log
    click button  OK
    unselect frame

Leave Document ID and Title blank
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    input text  ${elementReqDocID}  ${blank}
    input text  ${elementReqTitle}  ${blank}
    unselect frame

Leave Document ID blank, fill in Title ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    input text  ${elementReqDocID}  ${blank}
    input text  ${elementReqTitle}  ${title}
    unselect frame

Fill in Document ID ${dokumentID}, left Title field blank
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    input text  ${elementReqDocID}  ${dokumentID}
    input text  ${elementReqTitle}  ${blank}
    unselect frame

Warning Message appears DocID
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    execute javascript  var imput = document.getElementsByName('reqDocId'); imput[0].required = false;
    execute javascript  var imput = document.getElementsByName('req_title'); imput[0].required = false;
    click button  ${elementCreateReq}
    wait until page contains  Warning!!
    wait until page contains  Requirement document id cannot be empty!
    click button    OK
    unselect frame

Warning Message appears Title
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    execute javascript  var imput = document.getElementsByName('reqDocId'); imput[0].required = false;
    execute javascript  var imput = document.getElementsByName('req_title'); imput[0].required = false;
    click button  ${elementCreateReq}
    wait until page contains  Warning!!
    wait until page contains  Requirement title cannot be empty!
    click button    OK
    unselect frame

Choose Requirement Operation ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    click element  ${elementExpandTree}
    wait until page contains element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    wait until keyword succeeds  1min  0  double click element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathActions}
    click element  ${xpathActions}
    wait until page contains element  ${elementEditReq}
    unselect frame

Edit Requirement Operation
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${elementEditReq}
    click button  ${elementEditReq}
    wait until page contains element  ${elementCreateReq}
    wait until page contains element  ${elementReqStatus}
    wait until page contains element  ${elementReqType}
    unselect frame

Requirement Operation to Edit Requirement ${dokumentID} ${title}
    Choose Requirement Operation ${dokumentID} ${title}
    Edit Requirement Operation

Create Test Case From Requirement ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    #sleep  2
    wait until page contains element  xpath=//a[span[contains(text(), "${dokumentID}:${title} ")]]
    wait until keyword succeeds  1min  0  click element  xpath=//a[span[contains(text(), "${dokumentID}:${title} ")]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathActions}
    click element  ${xpathActions}
    wait until page contains element  ${buttonCreateTC}
    click button  ${buttonCreateTC}
    wait until page contains element  ${elementCreateTCFormReq}
    wait until page contains element  ${xpathCheckUncheck}
    click element  ${xpathCheckUncheck}
    click button  ${elementCreateTCFormReq}
    unselect frame

Create New Version Of Requirement ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    wait until page contains element  ${elementCollapseTree}
    click element  ${elementExpandTree}
    wait until page contains  ${dokumentID}:${title}
    wait until page contains element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    wait until keyword succeeds  1min  0  double click element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathActions}
    click element  ${xpathActions}
    wait until page contains element  ${elementEditReq}
    wait until page contains element  ${elementDeleteReq}
    wait until page contains element  ${elementFreezeReqVersion}
    wait until page contains element  ${elementCopyReq}
    wait until page contains element  ${elementNewRevision}
    wait until page contains element  ${elementNewButton}
    wait until page contains element  ${elementPrintFriendly}
    click button  ${elementNewButton}
    wait until page contains element  ${inputExtGen30}
    input text  ${inputExtGen30}  This is new log
    click button  OK
    unselect frame

Delete Requirement Specification NO
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathActions}
    click element  ${xpathActions}
    wait until page contains element  edit_req_spec
    wait until page contains element  ${elementDeleteSRS}
    click button  ${elementDeleteSRS}
    wait until page contains  No
    click button  No
    wait until page contains  Requirement Specification Operations
    unselect frame

Select More Than 1 Version Requirement ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    wait until page contains element  ${elementCollapseTree}
    click element  ${elementExpandTree}
    wait until page contains element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    wait until keyword succeeds  1min  0  double click element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  ${xpathActions}
    click element  ${xpathActions}
    wait until page contains element  ${elementEditReq}
    wait until page contains element  ${elementDeleteReq}
    wait until page contains element  ${elementFreezeReqVersion}
    wait until page contains element  ${elementCopyReq}
    wait until page contains element  ${elementNewRevision}
    wait until page contains element  ${elementNewButton}
    wait until page contains element  ${elementPrintFriendly}
    unselect frame

Delete More Than 1 Version Requirement ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    click button  delete_req_version
    wait until page contains element  ext-gen38
    wait until page contains  Yes
    click button  Yes
    wait until page contains  Req: ${dokumentID}-${title} Version 2 was successfully deleted
    unselect frame

Check Requirement Version ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    wait until page contains element  ${elementCollapseTree}
    click element  ${elementExpandTree}
    wait until page contains element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    wait until keyword succeeds  1min  0  double click element  xpath=//a[span[text()="${dokumentID}:${title}"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  workframe
    select frame  workframe
    wait until page contains element  xpath=//td[starts-with(text(), 'Version') and contains(text(), '1 revision')]
    unselect frame

Input ${Input} Filter ${Filter} Requirement Specification ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  filter_doc_id
    wait until page contains element  filter_title
    wait until page contains element  ${buttonDoUpdateTree}
    wait until page contains element  ${buttonResetFilters}
    input text  ${Input}  ${Filter}
    click element  ${buttonDoUpdateTree}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    page should contain element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    click element  ${buttonResetFilters}
    unselect frame

ComboBox ${Type} Filter ${Value} Requirement Specification ${dokumentID} ${title}
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  filter_status
    wait until page contains element  filter_type
    wait until page contains element  filter_spec_type
    wait until page contains element  ${buttonDoUpdateTree}
    wait until page contains element  ${elementExpandTree}
    wait until page contains element  ${buttonResetFilters}
    select from list by value  ${Type}  ${Value}
    click element  ${buttonDoUpdateTree}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  ${elementExpandTree}
    click element  ${elementExpandTree}
    unselect frame
    select frame  mainframe
    wait until page contains element  treeframe
    select frame  treeframe
    wait until page contains element  xpath=//span[contains(text(),"${dokumentID}:${title}")]
    page should contain element  xpath=//span[contains(text(),"${dokumentID}:${title}")]
    click element  ${buttonResetFilters}
    unselect frame


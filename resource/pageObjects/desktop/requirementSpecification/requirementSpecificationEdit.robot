*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${SERVER}        testlab.tesena.com/testlink
${DELAY}         0
${LOGIN URL}     http://${SERVER}/login.php
${WELCOME URL}   http://${SERVER}/index.php?caller=login
${ERROR URL}     http://${SERVER}/login.php
${BROWSER}      ff
${dokumentID}   newdokumentid
${title}        newtitle


*** Keywords ***

Create New Requirement Specification (type URS)
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=new_req_spec
    click element  name=new_req_spec
    wait until page contains element  title
    wait until page contains element  doc_id
    wait until page contains element  name=createSRS
    wait until page contains element  reqSpecType
    input text  doc_id  ${dokumentID}
    input text  title  ${title}
    select from list by value  reqSpecType  2
    click element  name=createSRS
    unselect frame

Choose Requirement Specification
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=expand_tree
    wait until page contains element  name=collapse_tree
    wait until page contains element  tree_div
    #click element  xpath=//ul[@class="x-tree-node-ct"]/li[contains(., "${dokumentID}:${title}")]
    #click element  xpath=//*[@id="extdd-13"]
    wait until page contains element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    click element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    unselect frame

Create Requirement Operations
    select frame  mainframe
    select frame  workframe
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=create_req
    click button  name=create_req
    wait until page contains element  name=create_req
    wait until page contains element  name=go_back
    wait until page contains element  req_title
    wait until page contains element  reqDocId
    wait until page contains element  reqType
    wait until page contains element  reqStatus
    input text  reqDocId  ${dokumentID}
    input text  req_title  ${title}
    select from list by value  reqStatus  F
    select from list by value  reqType  1
    click element  name=create_req
    unselect frame

Edit Requirement Operations
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    double click element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//ul[contains(., "${dokumentID}:${title}")]//ul//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    click element  xpath=//ul[contains(., "${dokumentID}:${title}")]//ul//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=edit_req
    click button  name=edit_req
    wait until page contains element  name=create_req
    wait until page contains element  name=go_back
    wait until page contains element  reqStatus
    wait until page contains element  reqType
    select from list by value  reqStatus  I
    select from list by value  reqType  6
    input text  expected_coverage  1
    click element  name=create_req
    wait until page contains element  ext-gen30
    input text  ext-gen30  This is new log
    click button  OK
    unselect frame

Check Edited Requirement Operations
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//table[tbody/tr[contains(.,"Version")]]
    wait until page contains  revision 2
    unselect frame

Create Test Case From Requirement
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=expand_tree
    wait until page contains element  name=collapse_tree
    wait until page contains element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    click element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=create_req
    wait until page contains element  name=importReq
    wait until page contains element  name=exportReq
    wait until page contains element  name=createReqFromIssueXML
    wait until page contains element  name=create_tcases
    wait until page contains element  name=copy_req
    click button  name=create_tcases
    wait until page contains element  name=create_tc_from_req
    click element  xpath=//*[@id="req_div"]/table/tbody/tr[2]/td[1]
    click button  name=create_tc_from_req
    unselect frame


Delete Requirement Specification
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=expand_tree
    wait until page contains element  name=collapse_tree
    wait until page contains element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    click element  xpath=//ul[li[contains(., "${dokumentID}:${title}")]]//a[contains(., "${dokumentID}:${title}")]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=/html/body/div/img
    click element  xpath=/html/body/div/img
    wait until page contains element  name=btn_new_req_spec
    wait until page contains element  name=edit_req_spec
    wait until page contains element  name=deleteSRS
    wait until page contains element  name=importReqSpec
    wait until page contains element  name=exportReq
    wait until page contains element  name=freeze_req_spec
    wait until page contains element  name=new_revision
    wait until page contains element  name=printerFriendly
    click button  name=deleteSRS
    wait until page contains  Yes
    click button  Yes
    wait until page contains  Requirement Specification: newtitle was successfully deleted
    unselect frame





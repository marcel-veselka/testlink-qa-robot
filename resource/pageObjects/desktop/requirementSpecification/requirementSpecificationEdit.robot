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
    wait until page contains element  name=export_all
    wait until page contains element  name=import_all
    click element  name=new_req_spec
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
    click element  xpath=//ul[@class="x-tree-node-ct"]/li[contains(., "${dokumentID}:${title}")]
    wait until page contains element  xpath=/html/body/div/img
    unselect frame

Create Requirement Operations
    select frame  mainframe
    select frame  workframe
    click element  xpath=/html/body/div/img
    wait until page contains element  name=create_req
    wait until page contains element  name=importReq
    wait until page contains element  name=exportReq
    wait until page contains element  name=createReqFromIssueXML
    click element  name=create_req
    wait until page contains element  name=create_req
    wait until page contains element  name=go_back
    input text  reqDocId  ${dokumentID}
    input text  req_title  ${title}
    select from list by value  reqStatus  3
    select from list by value  reqType  1
    click element  name=create_req
    unselect frame
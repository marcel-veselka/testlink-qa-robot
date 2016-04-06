*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${SERVER}                   testlab.tesena.com/testlink
${DELAY}                    0
${LOGIN URL}                http://${SERVER}/login.php
${WELCOME URL}              http://${SERVER}/index.php?caller=login
${ERROR URL}                http://${SERVER}/login.php
${BROWSER}                  ff
${dokumentID}               newdokumentid
${title}                    newtitle
${testSuiteName}            suiteTest
${testDescription}          testDescription
${testSuiteCopy}            copyFile
${testDescriptionCopy}      copyDescrition
${newTestProjectName}       NewNamedProject
${newTestProjectPrefix}     nnp


*** Keywords ***

Add Filters Test Case Title Test Specification

    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=filter_testcase_name
    wait until page contains element  name=doUpdateTree
    input text  name=filter_testcase_name  ${title}
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=expand_tree
    click element  name=expand_tree
    wait until page contains element  xpath=//a[span[contains(text(),"${title} [1]")]]
    click element  xpath=//a[span[contains(text(),"${title} [1]")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  The Test Case was generated from the assigned requirement "${title}"
    unselect frame

Delete Test Suite
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=filter_testcase_name
    wait until page contains element  name=doUpdateTree
    input text  name=filter_testcase_name  ${title}
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span[contains(text(),"${title} (")]]
    click element  xpath=//a[span[contains(text(),"${title} (")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=delete_testsuite
    click element  name=delete_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    #wait until page contains element  xpath=//img[@title="check/uncheck all"]
    #click element  xpath=//img[@title="check/uncheck all"]
    wait until page contains element  name=delete_testsuite
    click button  name=delete_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  The Test Suite was successfully deleted
    unselect frame

Delete New Test Suite
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=doUpdateTree
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    click element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=delete_testsuite
    click element  name=delete_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    #wait until page contains element  xpath=//img[@title="check/uncheck all"]
    #click element  xpath=//img[@title="check/uncheck all"]
    wait until page contains element  name=delete_testsuite
    click button  name=delete_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  The Test Suite was successfully deleted
    unselect frame


Create Test Suite Button
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=new_testsuite
    click element  name=new_testsuite
    unselect frame

Fill In The Fields
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=container_name
    wait until page contains element  name=add_testsuite_button
    wait until page contains element  cke_8
    input text  container_name  ${testSuiteName}
    click element  cke_8
    input text  xpath=//*[@id="cke_contents_details"]/textarea  ${testDescription}
    click element  name=add_testsuite_button
    unselect frame

Controll Warning Message
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=add_testsuite_button
    execute javascript  document.getElementById('name').required = false;
    click button  Save
    wait until page contains  Please give a name to Test Suite
    wait until page contains element  xpath=//button[text()="OK"]
    click element  xpath=//button[text()="OK"]
    unselect frame

Check If Test Suite Was Created
    select frame  mainframe
    select frame  workframe
    wait until page contains  Test Suite created
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=doUpdateTree
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    unselect frame

Create Another Test Suite For Move Or Copy
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span[contains(text(),"${newTestProjectName} (")]]
    double click element  xpath=//a[span[contains(text(),"${newTestProjectName} (")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=new_testsuite
    click element  name=new_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=container_name
    wait until page contains element  name=add_testsuite_button
    wait until page contains element  cke_8
    input text  container_name  ${testSuiteCopy}
    click element  cke_8
    input text  xpath=//*[@id="cke_contents_details"]/textarea  ${testDescriptionCopy}
    click element  name=add_testsuite_button
    unselect frame

Edit New Test Suite
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=expand_tree
    click button  name=expand_tree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    click element  xpath=//a[span/span[contains(text(),"${testSuiteName}")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=edit_testsuite
    click element  edit_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  name=container_name
    wait until page contains element  name=update_testsuite
    wait until page contains element  cke_8
    input text  container_name  ${testSuiteName} ${testSuiteCopy}
    click element  cke_8
    input text  xpath=//*[@id="cke_contents_details"]/textarea  ${testDescription} ${testDescriptionCopy}
    click element  name=update_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  updated!
    page should contain element  xpath=//p[contains(text(),"Test Suite suiteTest copyFile")][contains(text(),"was successfully")][contains(text(),"updated!")]
    unselect frame

Copy Test Suite
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=move_testsuite_viewer
    click element  name=move_testsuite_viewer
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="containerID_chosen"]
    wait until page contains element  name=do_copy
    execute javascript  document.getElementById("containerID").style.display = "initial";
    select from list by label  containerID  copyFile
    #input text  xpath=//*[@id="containerID_chosen"]/div/div/input  ${testSuiteCopy}
    #click element  xpath=//*[@id="containerID_chosen"]
    click element  name=do_copy
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//p[contains(text(),"Test Suite suiteTest copyFile")][contains(text(),"has been copied inside")][contains(text(),"copyFile")]
    unselect frame

Move Test Suite
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=expand_tree
    click button  name=expand_tree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteName} ${testSuiteCopy} (")]]
    double click element  xpath=//a[span/span[contains(text(),"${testSuiteName} ${testSuiteCopy} (")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=move_testsuite_viewer
    click element  name=move_testsuite_viewer
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//*[@id="containerID_chosen"]
    wait until page contains element  name=do_move
    execute javascript  document.getElementById("containerID").style.display = "initial";
    select from list by label  containerID  copyFile
    click element  name=do_move
    unselect frame

Check Move And Copy Action
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=expand_tree
    click button  name=expand_tree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    sleep  2
    xpath should match x times  //a[span/span[contains(text(),"${testSuiteName} ${testSuiteCopy} (")]]  2
    unselect frame

Delete Another New Test Suite
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  name=doUpdateTree
    click button  name=doUpdateTree
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains element  xpath=//a[span/span[contains(text(),"${testSuiteCopy}")]]
    click element  xpath=//a[span/span[contains(text(),"${testSuiteCopy}")]]
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains element  xpath=//img[@title="Actions"]
    click element  xpath=//img[@title="Actions"]
    wait until page contains element  name=delete_testsuite
    click element  name=delete_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    #wait until page contains element  xpath=//img[@title="check/uncheck all"]
    #click element  xpath=//img[@title="check/uncheck all"]
    wait until page contains element  name=delete_testsuite
    click button  name=delete_testsuite
    unselect frame
    select frame  mainframe
    select frame  workframe
    wait until page contains  The Test Suite was successfully deleted
    unselect frame
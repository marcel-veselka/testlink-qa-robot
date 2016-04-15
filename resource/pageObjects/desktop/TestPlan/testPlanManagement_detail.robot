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


*** Keywords ***

Input Name
    [Arguments]   ${TestPlanName}

    select frame  name=mainframe
    wait until page contains element  testplan_name
    input text  testplan_name  ${TestPlanName}
    unselect frame

Input Description

    select frame  name=mainframe
    wait until page contains  Description
    wait until page contains element  xpath=//iframe[@title="Rich text editor, notes"]
    mouse down  xpath=//iframe[@title="Rich text editor, notes"]
    mouse up  xpath=//iframe[@title="Rich text editor, notes"]
    #click element  cke_8_label
    select frame  xpath=//iframe[@title="Rich text editor, notes"]
    input text  xpath=//body  ${TestPlanDescription}
    #input text  xpath=//*[@id="cke_contents_notes"]/textarea  ${TestPlanDescription}
    unselect frame

wait until page contains all checkboxes from existing Test Plan

    select frame  mainframe
    wait until page contains  Copy User Roles
    wait until page contains  Copy Attachments
    wait until page contains  Copy Test Cases
    wait until page contains  Copy Builds
    wait until page contains  Copy Platforms Links
    wait until page contains  Copy Milestones
    unselect frame



Select Checkbox Active

    select frame  name=mainframe
    wait until page contains element  name=active
    select checkbox  active
    unselect frame

Select Checkbox Public

    select frame  name=mainframe
    wait until page contains element  name=is_public
    select checkbox  is_public
    unselect frame

unselect checkbox Public

    select frame  name=mainframe
    unselect checkbox  is_public
    unselect frame

unselect checkbox Active

    select frame  name=mainframe
    unselect checkbox  active
    unselect frame

unselect checkbox Copy User Roles

    select frame  name=mainframe
    unselect checkbox  copy_user_roles
    unselect frame

unselect checkbox Copy Test Cases

    select frame  name=mainframe
    unselect checkbox  copy_tcases
    unselect frame

unselect checkbox Copy Attachements

    select frame  name=mainframe
    unselect checkbox  copy_attachments
    unselect frame

unselect checkbox Copy Builds

    select frame  name=mainframe
    unselect checkbox  copy_builds
    unselect frame

unselect checkbox Copy Platforms Links

    select frame  name=mainframe
    unselect checkbox  copy_platforms_links
    unselect frame

unselect checkbox Copy Milestones

    select frame  name=mainframe
    unselect checkbox  copy_milestones
    unselect frame

Click Create button to finish Test Plan Management

    select frame  mainframe
    wait until page contains element  do_create
    click button  Create
    unselect frame

Warning Message Creating Same Test Plan Management

    select frame  mainframe
    wait until page contains  There is already a Test Plan with this name. Please choose another name!
    unselect frame

Click Button Delete Test Plan Management
    [Arguments]  ${TestPlanNameToDelete}

    select frame  mainframe
    wait until page contains  ${TestPlanNameToDelete}
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanNameToDelete}')]]/td[last()]/img[1]
    unselect frame

Confirm Delete Test Plan Management

    select frame  mainframe
    click button  Yes
    unselect frame

Check Test Plan Management Deleted
    [Arguments]  ${TestPlanNameToDelete}

    select frame  mainframe
    wait until page does not contain  ${TestPlanNameToDelete}
    unselect frame

Create from existing Test Plan?

    select frame  mainframe
    wait until page contains  Create from existing Test Plan?
    click element  copy_from_tplan_id
    click element  xpath=//*[@id="testplan_mgmt"]/table/tbody/tr[3]/td/select/option[2]
    unselect frame

Order By Name
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[2]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[2]
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[2]
    unselect frame

Order By Test Case
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/thead/tr/th[3]/img
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"1")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"1")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[3]/img
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"0")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"0")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[3]/img
    unselect frame

Order By Test Build
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/thead/tr/th[4]/img
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"1")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"1")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[4]/img
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"0")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"0")]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[4]/img
    unselect frame

Check Test Plan Is Active
    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Active (click to set inactive)"]]
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame

Click On Bulb Icon
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Active (click to set inactive)"]]/input
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Active (click to set inactive)"]]/input
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    unselect frame
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    unselect frame

Edit Test Plan
    select frame  mainframe
    wait until page contains element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[1]
    click element  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[1]
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[span//text()[contains(.,"[ID:")]]/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[span//text()[contains(.,"[ID:")]]/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    click element  xpath=//div/div/form/div/table/tbody/tr/td[span//text()[contains(.,"[ID:")]]/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    unselect frame
    select frame  mainframe
    wait until page contains element  name=testplan_name
    wait until page contains element  name=do_update
    input text  testplan_name  ${EditTestPlanName}
    unselect frame
    testPlanManagement_detail.Input Description
    select frame  mainframe
    click element  name=do_update
    unselect frame

Check Updated Test Plan
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${EditTestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${EditTestPlanName}")][contains(text()," ")]
    unselect frame

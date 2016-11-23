*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${inputTestPlanName}  testplan_name
${xpathTextEditor}  xpath=//iframe[@title="Rich text editor, notes"]
${checkboxActive}  active
${checkboxIsPublic}  is_public
${checkboxCopyUserRoles}  copy_user_roles
${checkboxCopyTC}  copy_tcases
${checkbpxCopyAttachments}  copy_attachments
${checkboxCopyBuild}  copy_builds
${checkboxCopyPlatform}  copy_platforms_links
${checkboxCopyMilestone}  copy_milestones
${xpathNameImage}  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[2]
${xpathTestCaseImage}  xpath=//*[@id="item_view"]/thead/tr/th[3]/img
${xpathTestCaseWidth1}  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"1")]
${xpathTestCaseWidth0}  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:8%;"][contains(text(),"0")]
${xpathItemViewImage}  xpath=//*[@id="item_view"]/thead/tr/th[1]/img[1]
${xpathBuildImage}  xpath=//*[@id="item_view"]/thead/tr/th[4]/img
${xpathBuildWidth1}  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"1")]
${xpathBuildWidth0}  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:6%;"][contains(text(),"0")]
${xpathPlatformImage}  xpath=//*[@id="item_view"]/thead/tr/th[5]/img
${xpathPlatformWidth1}  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:10%;"][contains(text(),"1")]
${xpathPlatformWidth0}  xpath=//div/div/form/div/table/tbody/tr/td[@style="width:10%;"][contains(text(),"0")]
${blank}

*** Keywords ***

Input Name
    [Arguments]   ${TestPlanName}
    select frame  mainframe
    wait until page contains element  ${inputTestPlanName}
    input text  ${inputTestPlanName}  ${TestPlanName}
    unselect frame

Input Description
    select frame  mainframe
    wait until page contains  Description
    wait until page contains element  ${xpathTextEditor}
    mouse down  ${xpathTextEditor}
    mouse up  ${xpathTextEditor}
    select frame  ${xpathTextEditor}
    input text  xpath=//body  ${TestPlanDescription}
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
    select frame  mainframe
    wait until page contains element  ${checkboxActive}
    select checkbox  ${checkboxActive}
    unselect frame

Select Checkbox Public
    select frame  mainframe
    wait until page contains element  ${checkboxIsPublic}
    select checkbox  ${checkboxIsPublic}
    unselect frame

unselect checkbox Public
    select frame  mainframe
    wait until page contains element  ${checkboxIsPublic}
    unselect checkbox  ${checkboxIsPublic}
    unselect frame

unselect checkbox Active
    select frame  mainframe
    wait until page contains element  ${checkboxActive}
    unselect checkbox  ${checkboxActive}
    unselect frame

unselect checkbox Copy User Roles
    select frame  mainframe
    wait until page contains element  ${checkboxCopyUserRoles}
    unselect checkbox  ${checkboxCopyUserRoles}
    unselect frame

unselect checkbox Copy Test Cases
    select frame  mainframe
    wait until page contains element  ${checkboxCopyTC}
    unselect checkbox  ${checkboxCopyTC}
    unselect frame

unselect checkbox Copy Attachements
    select frame  mainframe
    wait until page contains element  ${checkbpxCopyAttachments}
    unselect checkbox  ${checkbpxCopyAttachments}
    unselect frame

unselect checkbox Copy Builds
    select frame  mainframe
    wait until page contains element  ${checkboxCopyBuild}
    unselect checkbox  ${checkboxCopyBuild}
    unselect frame

unselect checkbox Copy Platforms Links
    select frame  mainframe
    wait until page contains element  ${checkboxCopyPlatform}
    unselect checkbox  ${checkboxCopyPlatform}
    unselect frame

unselect checkbox Copy Milestones
    select frame  mainframe
    wait until page contains element  ${checkboxCopyMilestone}
    unselect checkbox  ${checkboxCopyMilestone}
    unselect frame

Click Create button to finish Test Plan Management
    select frame  mainframe
    wait until page contains element  do_create
    click button  Create
    unselect frame

Click Button Delete Test Plan Management
    [Arguments]  ${TestPlanNameToDelete}
    select frame  mainframe
    wait until page contains  ${TestPlanNameToDelete}
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanNameToDelete}')]]/td[last()]/img[1]
    unselect frame

Click Button Assign Roles Test Plan Management
    [Arguments]  ${TestPlanName}
    select frame  mainframe
    wait until page contains  ${TestPlanName}
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td/a/img[@title="Assign roles"]
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

Create from existing Test Plan? ${TestPlanName}
    select frame  mainframe
    wait until page contains  Create from existing Test Plan?
    click element  xpath=//div/form/table/tbody/tr/td/select/option[.='${TestPlanName}']
    unselect frame
    select frame  mainframe
    wait until page contains element  ${checkboxCopyMilestone}
    wait until page contains element  ${checkboxCopyPlatform}
    wait until page contains element  ${checkboxCopyBuild}
    wait until page contains element  ${checkbpxCopyAttachments}
    wait until page contains element  ${checkboxCopyTC}
    wait until page contains element  ${checkboxCopyUserRoles}
    wait until page contains element  ${checkboxActive}
    wait until page contains element  ${checkboxIsPublic}
    unselect frame

Order By Name ${TestPlanName} ${TestPlanName1}
    select frame  mainframe
    wait until page contains element  ${xpathNameImage}
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    click element  ${xpathNameImage}
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    click element  ${xpathNameImage}
    unselect frame

Order By Test Case ${TestPlanName} ${TestPlanName1}
    select frame  mainframe
    wait until page contains element  ${xpathTestCaseImage}
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  ${xpathTestCaseWidth1}
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  ${xpathTestCaseWidth1}
    click element  ${xpathTestCaseImage}
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    wait until page contains element  ${xpathTestCaseWidth0}
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  ${xpathTestCaseWidth0}
    click element  ${xpathTestCaseImage}
    unselect frame

Order By Platform ${TestPlanName} ${TestPlanName1}
    select frame  mainframe
    wait until page contains element  ${xpathPlatformImage}
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  ${xpathPlatformWidth1}
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  ${xpathPlatformWidth1}
    click element  ${xpathPlatformImage}
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    wait until page contains element  ${xpathPlatformWidth0}
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  ${xpathPlatformWidth0}
    click element  ${xpathPlatformImage}
    unselect frame

Order By Test Build ${TestPlanName} ${TestPlanName1}
    select frame  mainframe
    wait until page contains element  ${xpathBuildImage}
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    wait until page contains element  ${xpathBuildWidth1}
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    page should contain element  ${xpathBuildWidth1}
    click element  ${xpathBuildImage}
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    wait until page contains element  ${xpathBuildWidth0}
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${TestPlanName1}")][contains(text()," ")]
    page should contain element  ${xpathBuildWidth0}
    click element  ${xpathBuildImage}
    unselect frame

Check Test Plan Is Active ${TestPlanName} ${TestPlanName1}
    select frame  mainframe
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Active (click to set inactive)"]]
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame

Click On Bulb Icon ${TestPlanName} ${TestPlanName1}
    select frame  mainframe
    #click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Active (click to set inactive)"]]/input
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    #click element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Active (click to set inactive)"]]/input
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Active (click to set inactive)"]]
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    page should contain element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    #click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]/input
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName}')]]/td[input[@title="Inactive (click to set active)"]]
    unselect frame
    select frame  mainframe
    #click element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]/input
    click element  xpath=//tr[td//text()[contains(.,'${TestPlanName1}')]]/td[input[@title="Inactive (click to set active)"]]
    unselect frame

Choose Test Plan ${TestPlanName} ${EditTestPlanName}
    select frame  mainframe
    wait until page contains element  ${xpathItemViewImage}
    click element  ${xpathItemViewImage}
    unselect frame
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td[span//text()[contains(.,"[ID:")]]/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    click element  xpath=//div/div/form/div/table/tbody/tr/td[span//text()[contains(.,"[ID:")]]/a[contains(text()," ")][contains(text(),"${TestPlanName}")][contains(text()," ")]
    unselect frame

Leave TestPlan ${TestPlanName} Name and Description blank
    select frame  mainframe
    wait until page contains element  ${inputTestPlanName}
    wait until page contains element  do_update
    input text  ${inputTestPlanName}  ${blank}
    execute javascript  var imput = document.getElementsByName('testplan_name'); imput[0].required = false;
    click element  do_update
    wait until page contains  You cannot enter Test plan without a name!
    wait until page contains  Warning!!
    click button  OK
    unselect frame

Edit Test Plan ${TestPlanName} ${EditTestPlanName}
    select frame  mainframe
    wait until page contains element  ${inputTestPlanName}
    wait until page contains element  do_update
    input text  ${inputTestPlanName}  ${EditTestPlanName}
    unselect frame
    testPlanManagement_detail.Input Description
    select frame  mainframe
    click element  do_update
    unselect frame

Check Updated Test Plan ${TestPlanName} ${EditTestPlanName}
    select frame  mainframe
    wait until page contains element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${EditTestPlanName}")][contains(text()," ")]
    page should contain element  xpath=//div/div/form/div/table/tbody/tr/td/a[contains(text()," ")][contains(text(),"${EditTestPlanName}")][contains(text()," ")]
    unselect frame

Make all Test Plan Active/Inactive ${TestPlanName} ${TestPlanName1}
    [Tags]  56
    testPlanManagement_detail.Check Test Plan Is Active ${TestPlanName} ${TestPlanName1}
    testPlanManagement_detail.Click On Bulb Icon ${TestPlanName} ${TestPlanName1}
    testPlanManagement_detail.Check Test Plan Is Active ${TestPlanName} ${TestPlanName1}

Edit And Check Test Plan ${TestPlanName} ${EditTestPlanName}
    [Tags]  56
    testPlanManagement_detail.Choose Test Plan ${TestPlanName} ${EditTestPlanName}
    testPlanManagement_detail.Leave TestPlan ${TestPlanName} Name and Description blank
    testPlanManagement_detail.Edit Test Plan ${TestPlanName} ${EditTestPlanName}
    testPlanManagement_detail.Check Updated Test Plan ${TestPlanName} ${EditTestPlanName}

Fill in all fields ${TestPlanName}
    testPlanManagement_detail.Input Name  ${TestPlanName}
    testPlanManagement_detail.Input Description
    testPlanManagement_detail.Select Checkbox Active
    testPlanManagement_detail.Select Checkbox Public
    testPlanManagement_detail.Click Create button to finish Test Plan Management

Create Test Plan ${TestPlanName} with Warning Message ${TestPlanName1}
    testPlanManagement_detail.Input Name  ${TestPlanName}
    testPlanManagement_detail.Create from existing Test Plan? ${TestPlanName1}
    testPlanManagement_detail.Select Checkbox Active
    testPlanManagement_detail.Click Create button to finish Test Plan Management

Create Test Plan ${TestPlanName} with unselected checkboxes ${TestPlanName1}
    testPlanManagement_detail.Input Name  ${TestPlanName}
    testPlanManagement_detail.Create from existing Test Plan? ${TestPlanName1}
    testPlanManagement_detail.unselect checkbox Copy User Roles
    testPlanManagement_detail.unselect checkbox Copy Attachements
    testPlanManagement_detail.unselect checkbox Copy Test Cases
    testPlanManagement_detail.unselect checkbox Copy Builds
    testPlanManagement_detail.unselect checkbox Copy Platforms Links
    testPlanManagement_detail.unselect checkbox Copy Milestones
    testPlanManagement_detail.unselect checkbox Active
    testPlanManagement_detail.unselect checkbox Public
    testPlanManagement_detail.Click Create button to finish Test Plan Management

Order by Name, TC, Build, Platform ${TestPlanName} ${TestPlanName1}
    testPlanManagement_detail.Order By Name ${TestPlanName} ${TestPlanName1}
    testPlanManagement_detail.Order By Test Case ${TestPlanName} ${TestPlanName1}
    testPlanManagement_detail.Order By Test Build ${TestPlanName} ${TestPlanName1}
    testPlanManagement_detail.Order By Platform ${TestPlanName} ${TestPlanName1}

Delete and Check ${TestPlanNameToDelete}
     testPlanManagement_detail.Click Button Delete Test Plan Management  ${TestPlanNameToDelete}
     testPlanManagement_detail.Confirm Delete Test Plan Management
     testPlanManagement_detail.Check Test Plan Management Deleted  ${TestPlanNameToDelete}
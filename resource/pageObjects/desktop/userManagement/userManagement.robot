*** Settings ***

Documentation  This is the resource file containing all methods based part of desktop which contains header

Library        Selenium2Library

*** Variables ***

${elementViewUsers}                     xpath=//div[@class="tabMenu"]//*[contains(text(),"View Users")]
${elementViewRoles}                     xpath=//div[@class="tabMenu"]//*[contains(text(),"View roles")]
${elementAssignTestProject}             xpath=//div[@class="tabMenu"]//*[contains(text(),"Assign Test Project roles")]
${elementAssignTestPlan}                xpath=//div[@class="tabMenu"]//*[contains(text(),"Assign Test Plan roles")]
${elementDoCreate}                      doCreate
${elementExport}                        export
${elementFirstName}                     firstName
${elementLastName}                      lastName
${elementEmail}                         emailAddress
${listRightsID}                         rights_id
${listLocale}                           locale
${listAuthentication}                   authentication
${checkboxActiveUser}                   user_is_active
${elementDoUpdate}                      do_update
${elementCancel}                        cancel
${elementResetPassword}                 do_reset_password
${xpathUserTable}                       xpath=//table
${xpathInputRole}                       xpath=//input[@name="rolename"]
${xpathInputSubmit}                     xpath=//input[@type="submit"]
${xpathFieldsetTestProject}             xpath=//fieldset[legend[text()="Test Project"]]/input[1]
${xpathTableItemView}                   xpath=//table[@id="item_view"]
${xpathTesterTesena}                    xpath=//tr[*[contains(text(),"tester (tester tesena)")]]//select




*** Keywords ***

I am here
    select frame  mainframe
    wait until page contains element  ${elementViewUsers}
    wait until page contains element  ${elementViewRoles}
    wait until page contains element  ${elementAssignTestProject}
    wait until page contains element  ${elementAssignTestPlan}
    wait until page contains element  css=div.workBack
    wait until page contains element  ${elementDoCreate}
    wait until page contains element  ${elementExport}
    unselect frame

Wait until page contains view users content
    select frame  mainframe
    wait until page contains element  ${elementViewUsers}
    wait until page contains element  ${elementViewRoles}
    wait until page contains element  ${elementAssignTestProject}
    wait until page contains element  ${elementAssignTestPlan}
    wait until page contains element  css=div.workBack
    wait until page contains element  ${elementDoCreate}
    wait until page contains element  ${elementExport}
    unselect frame

Click desired user
    select frame  mainframe
    click link  ${user}
    unselect frame

Fill inputs for editing user and submit
    select frame  mainframe
    clear element text  ${elementFirstName}
    clear element text  ${elementLastName}
    clear element text  ${elementEmail}
    input text   ${elementFirstName}  ${fname}
    input text   ${elementLastName}  ${lname}
    input text   ${elementEmail}  ${email}
    select from list by label  ${listRightsID}  guest
    select from list by label  ${listLocale}  Czech
    select from list by label  ${listAuthentication}  Default(DB)
    checkbox should be selected  ${checkboxActiveUser}
    click element  ${elementDoUpdate}
    unselect frame

Check all fields for editing user are availiable
    select frame  mainframe
    wait until page contains element  ${elementFirstName}
    wait until page contains element  ${elementLastName}
    wait until page contains element  ${elementEmail}
    wait until page contains element  ${listRightsID}
    wait until page contains element  ${listLocale}
    wait until page contains element  ${listAuthentication}
    wait until page contains element  ${elementDoUpdate}
    wait until page contains element  ${checkboxActiveUser}
    wait until page contains element  ${elementCancel}
    wait until page contains element  ${elementResetPassword}
    unselect frame

Create role ${role}
    page should not contain element  xpath=//a[contains(., "${role}")]
    select frame  mainframe
    wait until page contains element  ${xpathUserTable}
    wait until page contains element  ${elementDoCreate}
    click element  ${elementDoCreate}
    unselect frame
    select frame  mainframe
    wait until page contains element  ${xpathInputRole}
    input text  ${xpathInputRole}  ${role}
    wait until page contains element  ${xpathFieldsetTestProject}
    select checkbox  ${xpathFieldsetTestProject}
    wait until page contains element  ${xpathInputSubmit}
    click element  ${xpathInputSubmit}
    wait until page does not contain element  ${xpathInputRole}
    unselect frame
    select frame  mainframe
    wait until page contains element  ${xpathUserTable}
    wait until element contains  ${xpathUserTable}  ${role}
    unselect frame

Click bookmark ${bookmark}
    select frame  mainframe
    wait until page contains element  xpath=//div[@class="tabMenu"]/span[contains(., "${bookmark}")]
    click element  xpath=//div[@class="tabMenu"]/span[contains(., "${bookmark}")]
    unselect frame

Change user role in test project
    select frame  mainframe
    wait until page contains element  ${xpathTableItemView}
    wait until page contains element  ${xpathTesterTesena}
    select from list by label  ${xpathTesterTesena}  ${role}
    wait until page contains element  ${elementDoUpdate}
    click element  ${elementDoUpdate}
    unselect frame
    select frame  mainframe
    wait until page contains  User Roles updated
    unselect frame
    select frame  mainframe
    wait until page contains element  ${xpathTableItemView}
    wait until page contains element  ${xpathTesterTesena}
    select from list by label  ${xpathTesterTesena}  tester
    wait until page contains element  ${elementDoUpdate}
    click element  ${elementDoUpdate}
    unselect frame

Change user role in test plan
    select frame  mainframe
    wait until page contains element  ${xpathTableItemView}
    wait until page contains element  ${xpathTesterTesena}
    select from list by label  ${xpathTesterTesena}  ${role}
    wait until page contains element  ${elementDoUpdate}
    click element  ${elementDoUpdate}
    unselect frame
    select frame  mainframe
    wait until page contains  User Roles updated
    unselect frame
    select frame  mainframe
    wait until page contains element  ${xpathTableItemView}
    wait until page contains element  ${xpathTesterTesena}
    select from list by label  ${xpathTesterTesena}  tester
    wait until page contains element  ${elementDoUpdate}
    click element  ${elementDoUpdate}
    unselect frame

Delete role ${role}
    userManagement.Click bookmark View roles
    select frame  mainframe
    wait until page contains element  xpath=//tr[contains(.,"${role}")]//img[@title="Delete role"]
    double click element  xpath=//tr[contains(.,"${role}")]//img[@title="Delete role"]
    wait until page contains  You are going to delete: ${role}
    wait until page contains  Yes
    click button  Yes
    unselect frame

Edit user
    [Tags]  tp101
    userManagement.Check all fields for editing user are availiable
    userManagement.Fill inputs for editing user and submit

Choose bookmark and create role ${role}
    userManagement.Click bookmark View roles
    userManagement.Create role ${role}

Choose desired user
    userManagement.Wait until page contains view users content
    userManagement.Click desired user
*** Settings ***

Documentation  This is the resource file containing all methods based part of desktop which contains header
Library        Selenium2Library

*** Variables ***


*** Keywords ***

Wait until page contains view users content
    select frame  name=mainframe
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"View Users")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"View roles")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"Assign Test Project roles")]
    wait until page contains element  xpath=//div[@class="tabMenu"]//*[contains(text(),"Assign Test Plan roles")]
    wait until page contains element  css=div.workBack
    wait until page contains element  name=doCreate
    wait until page contains element  id=export
    unselect frame

Click create button
    select frame  name=mainframe
    click element  name=doCreate
    unselect frame

Check all fields for new user are availiable
    select frame  name=mainframe
    wait until page contains element  name=login
    wait until page contains element  name=firstName
    wait until page contains element  name=lastName
    wait until page contains element  name=password
    wait until page contains element  name=emailAddress
    wait until page contains element  name=rights_id
    wait until page contains element  name=locale
    wait until page contains element  name=authentication
    wait until page contains element  name=do_update
    wait until page contains element  name=user_is_active
    wait until page contains element  name=cancel
    wait until page contains element  name=do_reset_password
    unselect frame

Fill inputs for creating user and submit
    select frame  name=mainframe
    input text   name=login  ${login}
    input text   name=firstName  ${fname}
    input text   name=lastName  ${lname}
    input text   name=password  ${pass}
    input text   name=emailAddress  ${email}
    select from list by label  name=rights_id  admin
    select from list by label  name=locale  English (wide/UK)
    select from list by label  name=authentication  Default(DB)
    checkbox should be selected  name=user_is_active
    click element  name=do_update
    unselect frame

Check that user exists
    select frame  name=mainframe
    element should contain  css=div.workBack  ${login}
    unselect frame

Click desired user
    select frame  name=mainframe
    click link  ${login}
    unselect frame

Fill inputs for editing user and submit
    select frame  name=mainframe
    clear element text  name=firstName
    clear element text  name=lastName
    clear element text  name=emailAddress
    input text   name=firstName  ${fname}
    input text   name=lastName  ${lname}
    input text   name=emailAddress  ${email}
    select from list by label  name=rights_id  guest
    select from list by label  name=locale  Czech
    select from list by label  name=authentication  Default(DB)
    checkbox should be selected  name=user_is_active
    click element  name=do_update
    unselect frame

Check all fields for editing user are availiable
    select frame  name=mainframe
    wait until page contains element  name=firstName
    wait until page contains element  name=lastName
    wait until page contains element  name=emailAddress
    wait until page contains element  name=rights_id
    wait until page contains element  name=locale
    wait until page contains element  name=authentication
    wait until page contains element  name=do_update
    wait until page contains element  name=user_is_active
    wait until page contains element  name=cancel
    wait until page contains element  name=do_reset_password
    unselect frame


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

Check Builds/Releases
    select frame  name=mainframe
    wait until page contains  Build management
    unselect frame

Create Build
    select frame  name=mainframe
    wait until page contains element  create_build
    click button  create_build
    unselect frame

Check if warning message appears
    select frame  name=mainframe
    execute javascript  var imput = document.getElementsByName('build_name'); imput[0].required = false;
    wait until page contains element  do_create
    click element  do_create
    wait until page contains  Please enter a name for the Build!
    wait until page contains element  xpath=//button[text()="OK"]
    click element  xpath=//button[text()="OK"]
    unselect frame

Fill in the details of the Build ${buildName}
    #[Arguments]  ${BuildName}  ${Description}
    select frame  name=mainframe
    wait until page contains element  build_name
    input text  build_name  ${buildName}
    wait until page contains element  xpath=//iframe[@title="Rich text editor, notes"]
    mouse down  xpath=//iframe[@title="Rich text editor, notes"]
    mouse up  xpath=//iframe[@title="Rich text editor, notes"]
    select frame  xpath=//iframe[@title="Rich text editor, notes"]
    input text  xpath=//body  ${buildDescription}
    unselect frame

Save Build
    select frame  name=mainframe
    wait until page contains element  do_create
    click button  Create
    unselect frame

Save Build after Editing
    [Tags]  tp64
    select frame  name=mainframe
    wait until page contains element  do_update
    click button  Save
    unselect frame

Check if Build was created ${buildName}
    select frame  name=mainframe
    wait until page contains element  xpath=//a[contains(text(),"${buildName}")]
    unselect frame

Delete Build ${buildName}
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${buildName}')]]/td[last()]/img
    wait until page contains  You are going to delete: ${buildName}
    wait until page contains  Yes
    click button  Yes
    unselect frame

Add Release Date
    select frame  name=mainframe
    wait until page contains element  name=release_date
    click element  xpath=//img[@title="Show Calender"]
    wait until page contains  Today
    click button  Today
    unselect frame

Select Build ${buildName}
    select frame  name=mainframe
    wait until page contains element  xpath=//a[contains(text(),"${buildName}")]
    click link  ${buildName}
    wait until page contains  A build is identified by its title
    unselect frame

Choose template ${FromBuild}
    select frame  mainframe
    wait until page contains element  name=copy_tester_assignments
    select checkbox  name=copy_tester_assignments
    wait until page contains element  name=source_build_id
    select from list by label  name=source_build_id  ${FromBuild} (0)
    unselect frame
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

Fill in the details of the Build
    #[Arguments]  ${BuildName}  ${Description}
    select frame  name=mainframe
    wait until page contains element  build_name
    input text  build_name  ${BuildName}
    wait until page contains  Description
    wait until page contains element  cke_8_label
    click element  cke_8_label
    wait until page contains element  xpath=//*[@id="cke_contents_notes"]/textarea
    input text  xpath=//*[@id="cke_contents_notes"]/textarea  ${Description}
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

Check if Build was created
    select frame  name=mainframe
    sleep  2
    wait until page contains element  xpath=//a[contains(text(),"${BuildName}")]
    unselect frame

Delete Build
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${BuildName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame

Fill In Future Release Date
    select frame  mainframe
    wait until page contains element  name=release_date
    input text  release_date  ${ReleaseDate}
    unselect frame

Add Release Date
    select frame  name=mainframe
    click element  xpath=//img[@title="Show Calender"]
    #//tr[th//text()[contains(.,'Release date')]]/td[input[@title="Show Calender"]]
    #//*[@id="create_build"]/table/tbody/tr[5]/td/img[1]
    wait until page contains  Today
    click button  Today
    unselect frame

Select Build
    select frame  name=mainframe
    click link  ${BuildName}
    wait until page contains  A build is identified by its title
    unselect frame
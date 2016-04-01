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
    click button  create_build
    unselect frame

Check if warning message appears
    select frame  name=mainframe
    execute javascript  var imput = document.getElementsByName('build_name'); imput[0].required = false;
    click button  xpath=//*[@id="create_build"]/div/input[3]
    wait until page contains  Please enter a name for the Build!
    click button  ext-gen18
    unselect frame

Fill in the details of the Build
    sleep  1
    select frame  name=mainframe
    wait until page contains  Description
    click element  cke_8_label
    input text  xpath=//*[@id="cke_contents_notes"]/textarea  ${Description}
    input text  xpath=//*[@id="build_name"]  ${BuildName}
    unselect frame

Save Build
    select frame  name=mainframe
    click button  xpath=//*[@id="create_build"]/div/input[3]
    unselect frame

Check if Build was created
    select frame  name=mainframe
    wait until page contains  ${BuildName}
    unselect frame

Delete Build
    select frame  name=mainframe
    click element  xpath=//tr[td//text()[contains(.,'${BuildName}')]]/td[last()]
    wait until page contains  Yes
    click button  Yes
    unselect frame

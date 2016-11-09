*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library


*** Variables ***

${buttonCreateBuild}                create_build
${elementBuildDoCreate}             do_create
${xpathButtonOK}                    xpath=//button[text()="OK"]
${elementBuildName}                 build_name
${xpathTextEditor}                  xpath=//iframe[@title="Rich text editor, notes"]
${elementCopyTesterAssignment}      copy_tester_assignments
${elementSourceBuildID}             source_build_id
${blank}

*** Keywords ***

Check Builds/Releases
    select frame  mainframe
    wait until page contains  Build management
    unselect frame

Create Build
    wait until keyword succeeds  1min  0  buildsReleases.Check Builds/Releases
    select frame  mainframe
    wait until page contains element  ${buttonCreateBuild}
    click button  ${buttonCreateBuild}
    unselect frame

Check if warning message appears
    select frame  mainframe
    execute javascript  var imput = document.getElementsByName('build_name'); imput[0].required = false;
    wait until page contains element  ${elementBuildDoCreate}
    click element  ${elementBuildDoCreate}
    wait until page contains  Please enter a name for the Build!
    wait until page contains element  ${xpathButtonOK}
    click element  ${xpathButtonOK}
    unselect frame

Fill in the details of the Build ${buildName}
    select frame  mainframe
    wait until page contains element  ${elementBuildName}
    input text  ${elementBuildName}  ${buildName}
    #wait until page contains element  ${xpathTextEditor}
    #mouse down  ${xpathTextEditor}
    #mouse up  ${xpathTextEditor}
    #select frame  ${xpathTextEditor}
    #input text  xpath=//body  ${buildDescription}
    unselect frame

Check Warning Message
    select frame  mainframe
    execute javascript  var imput = document.getElementsByName('build_name'); imput[0].required = false;
    click element  do_update
    wait until page contains  Please enter a name for the Build!
    wait until page contains  Warning!!
    click button  OK
    unselect frame

Save Build with Warning Message
    select frame  mainframe
    wait until page contains element  do_update
    click button  Save
    unselect frame
    select frame  mainframe
    wait until page contains  There is already a build with this identifier -
    unselect frame

Save Build
    select frame  mainframe
    wait until page contains element  ${elementBuildDoCreate}
    click element  ${elementBuildDoCreate}
    unselect frame

Save Build after Editing
    [Tags]  tp64
    select frame  mainframe
    wait until page contains element  do_update
    click button  Save
    unselect frame

Check if Build was created ${buildName}
    select frame  mainframe
    wait until page contains element  xpath=//a[contains(text(),"${buildName}")]
    unselect frame

Delete ${buildName} Build
    select frame  mainframe
    click element  xpath=//tr[td//text()[contains(.,'${buildName}')]]/td[last()]/img
    wait until page contains  You are going to delete: ${buildName}
    wait until page contains  Yes
    click button  Yes
    unselect frame

Add Release Date
    select frame  mainframe
    wait until page contains element  release_date
    #click element  xpath=//img[@title="Show Calender"]
    #wait until page contains  Today
    #click button  Today
    input text  release_date  04/06/2016
    unselect frame

Select Build ${buildName}
    [Tags]  64
    select frame  mainframe
    wait until page contains element  xpath=//a[contains(text(),"${buildName}")]
    click link  ${buildName}
    wait until page contains  A build is identified by its title
    unselect frame

Choose template ${FromBuild}
    select frame  mainframe
    wait until page contains element  ${elementCopyTesterAssignment}
    select checkbox  ${elementCopyTesterAssignment}
    wait until page contains element  ${elementSourceBuildID}
    select from list by label  ${elementSourceBuildID}  ${FromBuild} (0)
    unselect frame

Add Details and Finish creating build ${buildName}
    [Tags]  tp61
    buildsReleases.Fill in the details of the Build ${buildName}
    buildsReleases.Save Build

Create Build With Release Date And Save ${buildName}
    [Tags]  tp62
    buildsReleases.Fill in the details of the Build ${buildName}
    buildsReleases.Add release date
    buildsReleases.Save Build

Edit Build Info and Save Changes ${buildName}
    [Tags]  64
    buildsReleases.Fill in the details of the Build ${blank}
    buildsReleases.Check Warning Message
    buildsReleases.Fill in the details of the Build ${buildName5}
    buildsReleases.Save Build with Warning Message
    buildsReleases.Fill in the details of the Build ${buildName}
    buildsReleases.Add Release Date
    buildsReleases.Save Build after Editing

Fill info and choose template ${NewNameBuild} ${FromBuild}
    buildsReleases.Fill in the details of the Build ${NewNameBuild}
    buildsReleases.Choose template ${FromBuild}
    buildsReleases.Save Build
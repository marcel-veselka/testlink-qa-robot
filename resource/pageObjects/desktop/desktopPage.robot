*** Settings ***

Documentation  This is the resource file containing all methods based on desktop page
Library        Selenium2Library


*** Variables ***

${customFields}                 Define Custom Fields
${checkCustomField}             Custom fields
${issueTracker}                 Issue Tracker Management
${checkIssueTracker}            Issue Tracker
${testProjectManagement}        Test Project Management
${assignUserRoles}              Assign User Roles
${checkAssignUserRoles}         User Management
${assignCustomFields}           Assign Custom Fields
${checkAssignCustomFields}      Assign custom fields
${keywordManagement}            Keyword Management
${platformManagement}           Platform Management
${requirmSpecification}         Requirement Specification
${checkRequirmSpecification}    Requirement Specifications
${requirmOverview}              Requirement Overview
${searchRequirements}           Search Requirements
${checkSearchRequirements}      Test Project
${searchRequirementSpec}        Search Requirement Specifications
${checkSearchRequirementSpec}   Search Requirement Specifications
${assignRequirements}           Assign Requirements
${checkAssignRequirements}      Navigator - Test Specification
${generateReqSpecDoc}           Generate Requirement Specification Document
${checkGenerateReqSpecDoc}      Test Plan
${testSpecification}            Test Specification
${checkTestSpecification}       Test Specification
${searchTestCases}              Search Test Cases
${assignKeywords}               Assign Keywords
${checkAssignKeywords}          Navigator - Test Specification
${testCasesPerUser}             Test Cases created per User
${testPlanManagement}           Test Plan Management
${buildReleases}                Builds / Releases
${checkBuildReleases}           Build management
${milestoneOverview}            Milestone Overview
${milestoneOverviewTRAVIS}      Milestones
${checkMilestoneOverview}       Milestones for
${executeTests}                 Execute Tests
${testCasesAssigned}            Test Cases Assigned to Me
${checkTestCasesAssigned}       Test Cases Assigned to User
${testReportsMetrics}           Test Reports and Metrics
${checkTestReportsMetrics}      Reports and Metrics
${metricsDashboard}             Metrics Dashboard
${checkMetricsDashboard}        Test Project
${addRemovePlatforms}           Add / Remove Platforms
${addRemoveTestCases}           Add / Remove Test Cases
${checkAddRemoveTestCases}      Add/Remove Test Cases
${assignTCExecution}            Assign Test Case Execution
${setUrgentTests}               Set Urgent Tests
${updateTCVersion}              Update Linked Test Case Versions
${showTCVersion}                Show Test Cases Newest Versions
${checkShowTCVersion}           Newest versions
${system}                       System
${verticalMenu}                 //div[@class="vertical_menu"]


*** Keywords ***
I am here
    select frame  mainframe
    wait until page contains  ${system}
    wait until page contains  ${customFields}
    wait until page contains  ${issueTracker}
    wait until page contains  ${checkSearchRequirements}
    wait until page contains  ${testProjectManagement}
    wait until page contains  ${assignUserRoles}
    wait until page contains  ${assignCustomFields}
    wait until page contains  ${keywordManagement}
    wait until page contains  ${platformManagement}
    wait until page contains  ${testSpecification}
    wait until page contains  ${testCasesPerUser}
    wait until page contains  ${checkGenerateReqSpecDoc}
    wait until page contains  ${testPlanManagement}
    xpath should match x times  ${verticalMenu}  2
    unselect frame

I am here in full
    wait until keyword succeeds  1min  0  desktopPage.I am here
    select frame  mainframe
    wait until page contains  ${requirmSpecification}
    wait until page contains  ${requirmOverview}
    wait until page contains  ${searchRequirements}
    wait until page contains  ${searchRequirementSpec}
    wait until page contains  ${assignRequirements}
    wait until page contains  ${generateReqSpecDoc}
    unselect frame

DesktopPage Go to ${link}
    select frame  mainframe
    wait until page contains  ${link}
    click link  ${link}
    unselect frame

Check link ${check}
    select frame  mainframe
    ${count}  get matching xpath count  //frame[@name="treeframe"]
    run keyword if  ${count} > 0  Check treeframe ${check}
    run keyword if  ${count} == 0  Check mainframe ${check}
    unselect frame

Check mainframe ${check}
    unselect frame
    select frame  mainframe
    wait until page contains  ${check}
    unselect frame

Check treeframe ${check}
    unselect frame
    select frame  mainframe
    select frame  treeframe
    wait until page contains  ${check}
    unselect frame




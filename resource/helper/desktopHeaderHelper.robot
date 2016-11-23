*** Settings ***
Library  Selenium2Library
Resource  ../../resource/pageObjects/desktop/desktopPage.robot
Resource  ../../resource/pageObjects/desktop/headerPage.robot

*** Variables ***

${customFields}                 Define Custom Fields
${checkCustomField}             Custom fields
${issueTrackerName}             Issue Tracker Management
${checkIssueTracker}
${testProjectManagement}        Test Project Management
${assignUserRoles}              Assign User Roles
${checkAssignUserRoles}         User Management
${assignCustomFields}           Assign Custom Fields
${checkAssignCustomFields}      Assign custom fields
${keywordManagement}            Keyword Management
${checkKeywordManagement}       Keyword Management
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


*** Keywords ***

Go to and check ${link} ${check}
    HeaderPage Go to ${indexPage}
    headerPage.I am here
    DesktopPage Go to ${link}
    desktopPage.Check link ${check}

Check desktop links
    Go to and check ${customFields} ${checkCustomField}
    Go to and check ${issueTrackerName} ${checkIssueTracker}
    Go to and check ${testProjectManagement} ${testProjectManagement}
    Go to and check ${assignUserRoles} ${checkAssignUserRoles}
    Go to and check ${assignCustomFields} ${checkAssignCustomFields}
    Go to and check ${keywordManagement} ${keywordManagement}
    Go to and check ${platformManagement} ${platformManagement}
    Go to and check ${requirmSpecification} ${checkRequirmSpecification}
    Go to and check ${requirmOverview} ${requirmOverview}
    Go to and check ${searchRequirements} ${checkSearchRequirements}
    Go to and check ${searchRequirementSpec} ${checkSearchRequirementSpec}
    Go to and check ${assignRequirements} ${checkAssignRequirements}
    Go to and check ${generateReqSpecDoc} ${checkGenerateReqSpecDoc}
    Go to and check ${testSpecification} ${checkTestSpecification}
    Go to and check ${searchTestCases} ${searchTestCases}
    Go to and check ${assignKeywords} ${checkAssignKeywords}
    Go to and check ${testCasesPerUser} ${testCasesPerUser}
    Go to and check ${testPlanManagement} ${testPlanManagement}
    Go to and check ${buildReleases} ${checkBuildReleases}
    Go to and check ${milestoneOverviewTRAVIS} ${checkMilestoneOverview}
    Go to and check ${executeTests} ${executeTests}
    Go to and check ${testCasesAssigned} ${checkTestCasesAssigned}
    Go to and check ${testReportsMetrics} ${checkTestReportsMetrics}
    Go to and check ${metricsDashboard} ${checkMetricsDashboard}
    Go to and check ${addRemovePlatforms} ${addRemovePlatforms}
    Go to and check ${addRemoveTestCases} ${checkAddRemoveTestCases}
    Go to and check ${assignTCExecution} ${assignTCExecution}
    Go to and check ${setUrgentTests} ${setUrgentTests}
    Go to and check ${updateTCVersion} ${updateTCVersion}
    Go to and check ${showTCVersion} ${checkShowTCVersion}

Change Test Project and go to ${link} ${check}
    Go to index page and change testproject
    DesktopPage Go to ${link}
    desktopPage.Check link ${check}

Click on ${link} ${check}
    HeaderPage Go to ${indexPage}
    DesktopPage Go to ${link}
    desktopPage.Check link ${check}

Go to index page and change testproject
    HeaderPage Go to ${indexPage}
    Choose test project from dropdown


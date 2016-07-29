*** Settings ***
Library  Selenium2Library

Resource  ../../resource/helper/desktopHeaderHelper.robot
Resource  ../../resource/pageObjects/desktop/system/defineCustomFields.robot
Resource  ../../resource/pageObjects/desktop/system/issueTrackerManagement.robot
Resource  ../../resource/pageObjects/desktop/system/editIssueTracker.robot

*** Variables ***

*** Keywords ***

Start creating Define Custom Fields
    [Tags]  tp105, tp126
    Change Test Project and go to ${customFields} ${checkCustomField}
    defineCustomFields.Creating Define Custom Fields

Edit information Custom Field and Check New Custom Field
    [Tags]  tp106
    Change Test Project and go to ${customFields} ${checkCustomField}
    defineCustomFields.Edit information CF and Check New CF

Delete Custom Field ${CFNAME}
    [Tags]  tp105
    Change Test Project and go to ${customFields} ${checkCustomField}
    defineCustomFields.Delete CF ${CFNAME}

Delete all created issue trackers
    [Tags]  tp107, tp108
    Go to and check ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.Delete Issue trackers

Delete created ${ISSUETRACKER}
    [Tags]  tp107, tp108
    Go to and check ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.${ISSUETRACKER} Delete

Create Issue Tracker ${ISSUETRACKER}
    [Tags]  tp108
    Change Test Project and go to ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.Create IT ${ISSUETRACKER}
    HeaderPage Go to ${indexPage}

Click created Issue Tracker with name ${ISSUETRACKER}
    [Tags]  tp108
    Change Test Project and go to ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.Check and Create Issue Tracker ${ISSUETRACKER}

Modify name and type of Issue Tracker
    [Tags]  tp108
    editIssueTracker.Modify name and type of Issue Tracker ${NEWISSUETRACKER}
    issueTrackerManagement.Check Issue Tracker named ${NEWISSUETRACKER}
    Click created Issue Tracker with name ${NEWISSUETRACKER}
    editIssueTracker.Modify name and type of Issue Tracker ${ISSUETRACKER}
    issueTrackerManagement.Check Issue Tracker named ${ISSUETRACKER}

Create all possible types of Issue Tracker and check it
    [Tags]  tp107
    Change Test Project and go to ${issueTrackerName} ${checkIssueTracker}
    issueTrackerManagement.Create all types of IssueTracker
*** Settings ***

Documentation  This is the resource file containing all methods available at Test Specification Page
Library        Selenium2Library

*** Variables ***
{@tcsID}  =  4
{@tcsName}  =  Login as admin
{@testSuite}  =  Layout
{@keyword}  =  renat
{@status}  =  Draft
{@importance}  =  High
{@type}  =  Automated

*** Keywords ***


Fill Test Case ID
    input text  filter_tc_id  {@tcsID}

Fill Test Case Title
    input text  filter_testcase_name  {@tcsName}

Click Test Suite dropdown
    click element  filter_toplevel_testsuite

Choose Test Suite from dropdown
    select from list by label  filter_toplevel_testsuite  {@testSuite}

Choose from keywords
    select from list by label  filter_keywords[]  {@keyword}

Check keywords radio button
    select radio button   xpath=(//div//input[@name="filter_keywords_filter_type"])[1]
    select radio button   xpath=(//div//input[@name="filter_keywords_filter_type"])[2]
    select radio button   xpath=(//div//input[@name="filter_keywords_filter_type"])[3]

Click Status dropdown
    click element  filter_workflow_status

Choose Status from dropdown
    select from list by label  filter_workflow_status  {@status}

Click Importance dropdown
    click element  filter_importance

Choose Importance from dropdown
    select from list by label  filter_importance  {@importance}

Click Execution type dropdown
    click element  filter_execution_type

Choose Execution type from dropdown
    select from list by label  filter_execution_type  {@type}

Click Apply
    click button  Apply

Click Reset Filters
    click button  Reset Filters

Click Expand tree
    click button  Expand tree

Click Collapse tree
    click button  Collapse tree

#//div[@id="tree_div"]/div/div/ul/li/div/a/span[contains(text(), "e")]
#//div[@id="tree_div"]/div/div/ul/li/div/a/span[contains(text(), "e")]

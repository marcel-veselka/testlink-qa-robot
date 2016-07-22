*** Settings ***
Library  Selenium2Library
Library  Collections
Library  RequestsLibrary
Library  OperatingSystem
Library  BuiltIn
Library  String
Library  XML

Resource  Plan.robot
Resource  Project.robot
Resource  Suite.robot
Resource  Case.robot
Resource  Build.robot


# pybot tests/api/Execution.robot

*** Variables ***
${DevKey}  445f3c920c0431a2b3d793114378d4dd
${session}   http://testlab.tesena.com/testlink/lib/api/xmlrpc/v1/xmlrpc.php
${prefix}  89
${testprojectname}  ProjectnameRF#7
${TestSuite}   TestSuita4
${TestCase}  TC#Uno
${TestBuild}  BuildTry

*** Test Cases ***

Api Tests

   Project.Create Test Project - all filled in ${prefix} ${testprojectname}
   Create Test Plan to Project with name ${testprojectname}
   Create Test Suite ${TestSuite}
   Create Test Case ${TestCase}
   Project.Get TestProjectID
   Create Test Build ${TestBuild}
   Project.Delete Project with prefix ${prefix}

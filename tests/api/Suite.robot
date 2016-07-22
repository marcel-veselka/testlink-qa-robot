*** Settings ***
Library  Selenium2Library
Library  Collections
Library  RequestsLibrary
Library  OperatingSystem
Library  BuiltIn
Library  String
Library  XML

Resource  DevKey.robot


# pybot Project/Suite.robot
*** Variables ***


${ReportsPath}  tests/api/Reports/


*** Keywords ***

Create Test Suite ${TestSuite}

################CHANGES DEV KEY####################
    DevKey.Change DevKey from file tests/api/xmls/CreateSuite.xml to Key ${DevKey}

  #####Takes ID from report of created Project######
   ${ProjectId}=	Get Element Text	${ReportsPath}XMLreportCreateProject.xml   	params/param/value/array/data/value/struct/member[name="id"]/value/string

    ####changing xml variables########
  ${xml}=  get file  tests/api/xmls/CreateSuite.xml
  ${testprojectid}=  get element text  	 ${xml}	 params/param/value/struct/member[name="testprojectid"]/value/string
  ${TestSuiteName}=  get element text  	 ${xml}	 params/param/value/struct/member[name="testsuitename"]/value/string
  ${newxml}=  replace string  ${xml}  ${testprojectid}  ${ProjectId}
  ####changng name of the test suite according to the variable in Execution file############
  ${newxml2}=  replace string  ${newxml}  ${TestSuiteName}  ${TestSuite}
  save xml  ${newxml2}  tests/api/xmls/CreateSuite.xml


   Create Session  httpbin  ${session}
   ${TextFileContent}=    OperatingSystem.Get File  tests/api/xmls/CreateSuite.xml
   Log    ${TextFileContent}

   ${resp}=  Post Request  httpbin  /post  data=${TextFileContent}
   Create File	${ReportsPath}XMLreportCreateSuite.xml	 ${resp.content}
   should contain  ${resp.content}     message
   should contain  ${resp.content}     ok

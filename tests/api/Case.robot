*** Settings ***
Library  Selenium2Library
Library  Collections
Library  RequestsLibrary
Library  OperatingSystem
Library  BuiltIn
Library  String
Library  XML
Resource  DevKey.robot


*** Variables ***


${ReportsPath}  tests/api/Reports/
${xmlssaved}    tests/api/xmls/

*** Keywords ***

Create Test Case ${TestCase}
    ################CHANGES DEV KEY####################
    DevKey.Change DevKey from file ${xmlssaved}CreateCase.xml to Key ${DevKey}


  #####Takes IDs from report of created Project and Suite######
   ${GetProjectId}=	Get Element Text	${ReportsPath}XMLreportCreateProject.xml   	params/param/value/array/data/value/struct/member[name="id"]/value/string
    ${GetTestSuiteId}=	Get Element Text	${ReportsPath}XMLreportCreateSuite.xml   	params/param/value/array/data/value/struct/member[name="id"]/value/string

    ####changing xml variables########
  ${xml}=  get file  ${xmlssaved}CreateCase.xml
  ${testcasename}=  get element text     ${xml}	 params/param/value/struct/member[name="testcasename"]/value/string
  ${testprojectid}=  get element text  	 ${xml}	 params/param/value/struct/member[name="testprojectid"]/value/string
  ${testsuiteid}=  get element text  	 ${xml}	 params/param/value/struct/member[name="testsuiteid"]/value/string
  ${newxml}=  replace string  ${xml}  ${testcasename}  ${TestCase}
  ${newxml2}=  replace string  ${newxml}  ${testprojectid}  ${GetProjectId}
  ####changng name of the test suite according to the variable in Execution file############
  ${newxml3}=  replace string  ${newxml2}  ${testsuiteid}  ${GetTestSuiteId}
  save xml  ${newxml3}  ${xmlssaved}CreateCase.xml


   Create Session  httpbin  ${session}
   ${TextFileContent}=    OperatingSystem.Get File  ${xmlssaved}CreateCase.xml
   Log    ${TextFileContent}

   ${resp}=  Post Request  httpbin  /post  data=${TextFileContent}
   Create File	${ReportsPath}XMLreportCreateBuild.xml	 ${resp.content}
   should contain  ${resp.content}     message
   should contain  ${resp.content}     ok

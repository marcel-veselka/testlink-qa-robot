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


#${Reportssaved}  tests/api/Reports/
${xmlssaved}     tests/api/xmls/


*** Keywords ***

Create Test Build ${TestBuild}

################CHANGES DEV KEY####################
   DevKey.Change DevKey from file ${xmlssaved}CreateBuild.xml to Key ${DevKey}


  #####Takes ID from report of created Plan######
   ${GetPlanId}=	Get Element Text	${Reportssaved}XMLreportCreatePlan.xml   	params/param/value/array/data/value/struct/member[name="id"]/value/string

    ####Getting xml variables via xpath########
  ${xml}=  get file  ${xmlssaved}CreateBuild.xml
  ${testplanid}=  get element text  	 ${xml}	 params/param/value/struct/member[name="testplanid"]/value/string
  ${buildname}=  get element text  	 ${xml}	 params/param/value/struct/member[name="buildname"]/value/string
 ####changing xml variables########
  ${newxml}=  replace string  ${xml}  ${testplanid}  ${GetPlanId}
  ####changng name of the test suite according to the variable in Execution file############
  ${newxml2}=  replace string  ${newxml}  ${buildname}  ${TestBuild}

  save xml  ${newxml2}  ${xmlssaved}CreateBuild.xml


   Create Session  httpbin  ${session}
   ${TextFileContent}=    OperatingSystem.Get File  ${xmlssaved}CreateBuild.xml
   Log    ${TextFileContent}

   ${resp}=  Post Request  httpbin  /post  data=${TextFileContent}
   Create File	${Reportssaved}XMLreportCreateBuild.xml	 ${resp.content}
   should contain  ${resp.content}     Success!
   should contain  ${resp.content}     message
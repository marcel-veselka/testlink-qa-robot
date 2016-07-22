*** Settings ***
Library  Selenium2Library
Library  Collections
Library  RequestsLibrary
Library  OperatingSystem
Library  BuiltIn
Library  String
Library  XML

Resource  DevKey.robot

# pybot Project/Project.robot
*** Variables ***


${ReportsPath}  tests/api/Reports/
${xmlssaved}    tests/api/xmls/

*** Keywords ***

Create Test Plan to Project with name ${testprojectname}
        ################CHANGES DEV KEY####################
    DevKey.Change DevKey from file ${xmlssaved}CreatePlan.xml to Key ${DevKey}


    ${xml}=  get file  ${xmlssaved}CreatePlan.xml
  ${Projectname}=  get element text  	 ${xml}	 params/param/value/struct/member[name="testprojectname"]/value/string
  ${newxml}=  replace string  ${xml}  ${Projectname}  ${testprojectname}
  save xml  ${newxml}  ${xmlssaved}CreatePlan.xml

   Create Session  httpbin  ${session}
   ${TextFileContent}=    OperatingSystem.Get File  ${xmlssaved}CreatePlan.xml
   Log    ${TextFileContent}

   ${resp}=  Post Request  httpbin  /post  data=${TextFileContent}  # headers=${headers}
   Create File	${ReportsPath}XMLreportCreatePlan.xml	 ${resp.content}
   should contain  ${resp.content}     Success!

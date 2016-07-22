*** Settings ***
Library  Selenium2Library
Library  Collections
Library  RequestsLibrary
Library  OperatingSystem
Library  BuiltIn
Library  String
Library  XML


*** Variables ***


*** Keywords ***

Change DevKey from file ${file} to Key ${DevKey}

    ####changing xml variables########
  ${xml}=  get file  ${file}
  ${testprojectid}=  get element text  	 ${xml}	 params/param/value/struct/member[name="devKey"]/value/string
  ${newxml}=  replace string  ${xml}  ${testprojectid}  ${DevKey}
  save xml  ${newxml}  ${file}

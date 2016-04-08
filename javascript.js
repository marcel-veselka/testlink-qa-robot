// JavaScript Document
var imput = document.getElementsByName('tprojectName');
var imput2 = document.getElementsByName('tcasePrefix');
imput[0].required = false;
imput2[0].required = false;
// document.getElementById('id').required = false;

Buuuu
    testlink.Login as admin correct
    testlink.Start creating new test project without conflict
    select frame  mainframe
    execute javascript  C:/Users/Jan/PycharmProjects/testlink-qa-robot/javascript.js
    unselect frame
    createTestProjectPage.Click Create
    createTestProjectPage.Confirm warning about empty fields


execute javascript  document.getElementById('name').required = false;
click button  Save
wait until page contains  Please give a name to Test Suite
wait until page contains element  xpath=//button[text()="OK"]
click element  xpath=//button[text()="OK"]

document.evaluate("//a[contains(.,"superProject (0)")]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.display = "block";
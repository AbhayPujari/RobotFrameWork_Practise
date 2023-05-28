*** Settings ***
Documentation   Resource File
Library     SeleniumLibrary
Resource    ../PO/Generic.robot

*** Variables ***

*** Keywords ***
Enter the country and select the terms
     [Arguments]  ${Country_Name}
     input text     id:country     ${Country_Name}
     #Wait until element is passed is located on page        //a[text()='${Country_Name}']
     sleep    5s
     click element       //a[text()='${Country_Name}']
     wait until element is not visible    //a[text()='${Country_Name}']
     click element    //label[@for='checkbox2']

Purchase the Product and confirm the purchase
     click button           css:.btn-success
     page should contain    Success!
*** Settings ***
Documentation   Resource File
Library     SeleniumLibrary

*** Variables ***
${Invalid_User_Name}        Abhay
${Invalid_Password}         Abhay
${Valid_User_Name}          rahulshettyacademy
${Valid_Password}           learning
${URL}                      https://www.rahulshettyacademy.com/loginpagePractise/
${Browser_name}             Chrome


*** Keywords ***
Open the browser with URL
    #create webdriver     ${Browser_name}          executable_path=C:/Users/AbhayPujari/Desktop/chromedriver.exe
    open browser        ${URL}                   ${Browser_name}
    #go to                ${URL}
    #create webdriver    Chrome          executable_path=C:/Users/AbhayPujari/AppData/Local/Programs/Python/Python36/Scripts
    #open browser    https://www.rahulshettyacademy.com/loginpagePractise/   Chrome

Open the browser with the URL for parellel browser test
    [Arguments]   ${Browser_name}
    create webdriver     ${Browser_name}      executable_path=Resource/${Browser_name}
    go to    ${URL}

Wait until element is passed is located on page
    [arguments]  ${page_locator}
    wait until element is visible    ${page_locator}



*** Settings ***
Documentation   To Validate Login form
Library         SeleniumLibrary
Library         DataDriver          file=Resource/data.csv         encoding=utf_8      dialect=unix
Test Template   Validate Unsuccesful Login
Test Teardown    Close Browser

*** Variables ***
${Error_message_login}          css:.alert-danger

*** Test Cases ***
login with username ${username} and password ${password}           XYZ         123456
*** Keywords ***
Validate Unsuccesful Login
    [Arguments]      ${username}     ${password}
    Open the browser with URL
    Fill the Login form      ${username}     ${password}
    Wait until it checks and display error message
    Verify erorr message is correct

Open the browser with URL
    #create webdriver    Chrome          executable_path=C:/Users/AbhayPujari/AppData/Local/Programs/Python/Python36/Scripts
    open browser    https://www.rahulshettyacademy.com/loginpagePractise/   Chrome

Fill the Login form
    [Arguments]    ${username}     ${password}
    input text    id:username     ${username}
    input password      id:password     ${password}
    click button    signInBtn

Wait until it checks and display error message
   wait until element is visible    ${Error_message_login}

Verify erorr message is correct
     ${error}=    get text     ${Error_message_login}
     Should Be Equal As Strings    ${error}    Incorrect username/password.
     element text should be       ${Error_message_login}          Incorrect username/password.



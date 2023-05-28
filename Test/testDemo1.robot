*** Settings ***
Documentation   To Validate Login form
Library         SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_message_login}          css:.alert-danger
${Username}                     Abhay
${Password}                     Abhay

*** Test Cases ***
Validate Unsuccesful Login
    Open the browser with URL
    Fill the Login form
    Wait until it checks and display error message
    Verify erorr message is correct


*** Keywords ***
Open the browser with URL
    #create webdriver    Chrome          executable_path=C:/Users/AbhayPujari/AppData/Local/Programs/Python/Python36/Scripts
    open browser    https://www.rahulshettyacademy.com/loginpagePractise/   Chrome

Fill the Login form
    input text    id:username     ${Username}
    input password      id:password     ${Password}
    click button    signInBtn

Wait until it checks and display error message
   wait until element is visible    ${Error_message_login}

Verify erorr message is correct
     ${error}=    get text     ${Error_message_login}
     Should Be Equal As Strings    ${error}    Incorrect username/password.
     element text should be       ${Error_message_login}          Incorrect username/password.



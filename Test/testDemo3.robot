*** Settings ***
Documentation    To Validate Login form
Library          SeleniumLibrary
Library          Collections
Library          String
Test Setup       Open the browser with URL
#Test Teardown    Close Browser
Resource         ../PO/Generic.robot


*** Variables ***
${Error_message_login}          css:.alert-danger
${Shop_load_Page}               css:.nav-link
${Username}
${Password}



*** Test Cases ***
#Validate Unsuccesful Login
#    Fill the Login form         ${Invalid_Username}  ${Invalid_Password}
#    Wait until it checks and display element    ${Error_message_login}
#    Verify erorr message is correct
#    Close Browser Session

Validate Child window functionality
    Select the link of child window
    Verify the user is Switched to child window
    Grab the email id in the child window
    Switch to parent window enter the email


*** Keywords ***
Select the link of child window
        Click element    css:.blinkingText
        sleep  5s

Verify the user is Switched to child window
        switch window    NEW
        element text should be     css:h1      DOCUMENTS REQUEST
        ${title}=   get title
        title should be     ${title}    Rahul Shetty Academy
Grab the email id in the child window
        ${text}=     get text     css:.red
        @{String}=   split string    ${text}   at
        ${email}=    Get From List    ${String}   1
        @{String_1}=   split string    ${email}
        ${email}=    Get From List    ${String_1}   0
        Set Global Variable      ${email}
Switch to parent window enter the email
        switch window     MAIN
        ${title}=   get title
        title should be     ${title}    LoginPage Practise | Rahul Shetty Academy
        input text        id:username        ${email}







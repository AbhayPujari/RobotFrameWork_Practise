*** Settings ***
Documentation   Resource File
Library     SeleniumLibrary

*** Variables ***
${Error_message_login}          css:.alert-danger

*** Keywords ***
Fill the Login form
    [arguments]   ${Username}  ${Password}
    input text    id:username     ${Username}
    input password      id:password     ${Password}
    click button    signInBtn

Verify erorr message is correct
     ${error}=    get text     ${Error_message_login}
     Should Be Equal As Strings    ${error}    Incorrect username/password.
     element text should be       ${Error_message_login}          Incorrect username/password.

Fill the Login details in the form
         [arguments]   ${Username}  ${Password}
          input text          id:username     ${Username}
          input password      id:password     ${Password}
          click element       css:input[value="user"]
          wait until element is visible      css:.modal-body
          click button        xpath://button[@id='okayBtn']
          click button        xpath://button[@id='okayBtn']
          wait until element is not visible   css:.modal-body
          select from list by value      css:select.form-control        teach
          select checkbox       xpath://input[@id='terms']
          checkbox should be selected     id:terms
          click button      signInBtn
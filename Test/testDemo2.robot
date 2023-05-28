*** Settings ***
Documentation    To Validate Login form
Library          SeleniumLibrary
Library          Collections
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

Validate Card display in the shopping page
    Fill the Login form     ${Valid_User_Name}       ${Valid_Password}
    Wait until it checks and display element    ${Shop_load_Page}
    Verify Card Titles in the Shop Page
    Select the Card             Nokia Edge

Select the Form and Login as User
      Fill the Login details in the form    ${Valid_User_Name}       ${Valid_Password}

*** Keywords ***
Open the browser with URL
    #create webdriver    Chrome          executable_path=C:/Users/AbhayPujari/AppData/Local/Programs/Python/Python36/Scripts
    open browser    https://www.rahulshettyacademy.com/loginpagePractise/   Chrome

Fill the Login form
    [arguments]   ${Username}  ${Password}
    input text    id:username     ${Username}
    input password      id:password     ${Password}
    click button    signInBtn

Wait until it checks and display element
   [arguments]  ${element}
   wait until element is visible    ${element}

Verify erorr message is correct
     ${error}=    get text     ${Error_message_login}
     Should Be Equal As Strings    ${error}    Incorrect username/password.
     element text should be       ${Error_message_login}          Incorrect username/password.

Verify Card Titles in the Shop Page
      @{expectedList}=    Create list   iphone X   Samsung Note 8   Nokia Edge  Blackberry
      ${elements}=        Get WebElements   css:.card-title
      @{actualList}=      Create List
      FOR   ${index}  IN  @{elements}
           Log  ${index.text}
           append to list       ${actualList}       ${index.text}
      END

      Lists Should be Equal    ${actualList}   ${expectedList}

Select the Card
      [arguments]    ${cardName}
      ${elements}=        Get WebElements   css:.card-title
      ${index}=  Set Variable   1
      FOR   ${element}  IN  @{elements}

           Exit For Loop If    '${cardName}' == '${element.text}'
                 ${index}=  Evaluate  ${index} + 1
      END
                click button       xpath:(//*[@class='card-footer'])[${index}]/button



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
Close Browser Session
      close browser



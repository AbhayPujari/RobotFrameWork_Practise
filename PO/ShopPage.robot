*** Settings ***
Documentation   Resource File
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
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


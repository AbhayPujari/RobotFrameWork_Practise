*** Settings ***
Documentation    To Validate Login form
Library           SeleniumLibrary
Library           Collections
Library           ../customLibraries/Shop.py
Test Setup        Open the browser with the URL for parellel browser test   Firefox
Suite Setup
Suite Teardown
Test Teardown     Close Browser
Resource          ../PO/Generic.robot
Resource          ../PO/LandingPage.robot
Resource          ../PO/ShopPage.robot
Resource          ../PO/ConfirmationPage.robot

*** Variables ***

@{listofProducts}                 Nokia Edge    Blackberry
@{Prdaddedtocart}

*** Test Cases ***
Validate Unsuccesful Login
    LandingPage.Fill the Login form         ${Invalid_Username}  ${Invalid_Password}
    Wait until element is passed is located on page     css:.alert-danger
    LandingPage.Verify erorr message is correct

Validate Card display in the shopping page
    LandingPage.Fill the Login form     ${Valid_User_Name}       ${Valid_Password}
    Wait until element is passed is located on page    css:.nav-link
    ShopPage.Verify Card Titles in the Shop Page
    #Select the Card       IphoneX    Nokia Edge
    add items to cart and checkout                ${listofProducts}
    Verify product added in checkout list and proceed         ${listofProducts}   ${Prdaddedtocart}
    ConfirmationPage.Enter the country and select the terms        India
    ConfirmationPage.Purchase the Product and confirm the purchase

Select the Form and Login as User
      LandingPage.Fill the Login details in the form    ${Valid_User_Name}       ${Valid_Password}





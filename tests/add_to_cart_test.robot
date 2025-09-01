*** Settings ***
Library    Browser
Resource    ../resource/constants/add_to_cart_constants.resource
Resource    ../resource/auth.resource
Resource     ../resource/constants/valid_login_constants.resource
Resource    ../resource/add_to_cart.resource
Suite Setup    New Browser And Go To Login Page
Suite Teardown    Close Browser


*** Test Cases ***
Add All Items To Cart And Verify
    [Documentation]    Login, add all items to cart, and verify all are added
    Log In With Valid Credentials
    ${Number of all items}=    Add All Items To Cart


    Go To Cart And Verify Items   ${Number of all items}
     
    




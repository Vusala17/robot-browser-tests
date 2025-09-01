*** Settings ***
Library    Browser
Resource   ../resource/constants/add_to_cart_constants.resource
Resource   ../resource/locators/add_to_cart_locators.resource



*** Keywords ***

Add All Items To Cart
    ${count}=    Get Element Count    ${LOCATOR_ADD_TO_CART_BUTTONS}
    ${button} =     Get Elements   ${LOCATOR_ADD_TO_CART_BUTTONS}
    FOR    ${btn}    IN    @{button}
        Click    ${btn}
    END
    RETURN    ${count}

Go To Cart And Verify Items
    [Arguments]   ${product_count}
    Click    ${CART_ICON}
    ${cart_items}=    Get Elements    ${CART_ITEM}
    ${cart_count}=    Get Length    ${cart_items}
    Should Be Equal As Integers    ${product_count}    ${cart_count}
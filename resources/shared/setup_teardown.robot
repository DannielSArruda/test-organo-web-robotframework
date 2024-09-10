*** Settings ***
Resource    ../main.robot

*** Keywords ***
I access Organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Close the browser
    Capture Page Screenshot
    Close Browser
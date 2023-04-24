*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
My First Test
    Open Browser    https://pl.wikipedia.org    Chrome    executable_path=C:/chromedriver/chromedriver.exe
    Click Element    id:pt-login

    Input Text    id:wpName1    RobotTests
    input password  id:wpPassword1    RobotFramework
    Select Checkbox    id:wpRemember
    click button    id:wpLoginAttempt

    Sleep    2
    Close browser
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login}    RobotTests
${good_password}    RobotFramework
${wrong_password}    wrong_pass
${error_message}    Podany login lub hasło są nieprawidłowe. Spróbuj jeszcze raz.

*** Test Cases ***
My First Test
    Open Browser    https://pl.wikipedia.org    Chrome    executable_path=C:/chromedriver/chromedriver.exe
    Click Element    id:pt-login
    Wait Until Element Is Visible    id:wpName1    7
    Input Text    id:wpName1    RobotTests
    input password  id:wpPassword1    RobotFramework
    Select Checkbox    id:wpRemember
    click button    id:wpLoginAttempt
    input text    name:search    Teoria Wielkiego Podrywu
    click button  id:searchButton
    Capture Page Screenshot
    Sleep    2
    Close browser

MySecondTest
    Open Browser    https://pl.wikipedia.org    Chrome    executable_path=C:/chromedriver/chromedriver.exe
    Click Element    id:pt-login
    Wait Until Element Is Visible    id:wpName1    7
    Clear Element Text    id:wpName1
    Input Text    id:wpName1    ${login}
    input password  id:wpPassword1    ${wrong_password}
    Checkbox Should Not Be Selected    id:wpRemember
    Select Checkbox    id:wpRemember
    click button    id:wpLoginAttempt
    wait until element is visible      //*[@id="userloginForm"]/form/div[1]    5
    ${my_error_message}    Get Text    //*[@id="userloginForm"]/form/div[1]
    log    ${my_error_message}
    log to console   ${my_error_message}
    Should Be Equal As Strings    ${my_error_message}     ${error_message}
    Capture Page Screenshot
    Sleep    2
    Close browser
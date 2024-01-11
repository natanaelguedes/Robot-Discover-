*** Settings ***
Documentation        Suites de casos de testes

Library                      Browser

*** Test Cases ***
homepage deve estar online
    New Browser   browser=chromium    headless=false
    New Page    https://walkdog.vercel.app/signup
    Sleep    2
    Wait For Elements State         form h1     visible    5
    Get text        form h1        equal        Faça seu cadastro
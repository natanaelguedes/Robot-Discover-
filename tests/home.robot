*** Settings ***
Documentation        Suites de casos de testes

Library                      Browser

*** Test Cases ***
homepage deve estar online
    New Browser   browser=chromium    headless=false
    New Page    https://walkdog.vercel.app/
    Sleep    2
    Take Screenshot

*** Settings ***
Documentation        arquivo principal do projeto

Library        Browser
Resource      actions/signup.resource    

*** Keywords ***
Start_session
    New Browser   browser=chromium    headless=false
    New Page    https://walkdog.vercel.app/signup 
   
Finish Session
    Take Screenshot     fullPage=True
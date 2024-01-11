*** Settings ***
Documentation        Ações, steps e elementos da funcionalidade  de cadastro 

Library                Browser

*** Keywords ***

GO TO SIGNUP PAGE

     Click  css=a[href="/signup"]

     Wait For Elements State                        form h1       visible          5000
     
     Get Text                               form h1    equal         Faça seu cadastro

 FILL SIGNUP FORM 
     [Arguments]     ${dog_walker} 
     Fill Text                                      css=input[name=name]                             ${dog_walker}[name]
     Fill Text                                      css=input[name=email]                            ${dog_walker}[email]
     Fill Text                                      css=input[name=cpf]                              ${dog_walker}[cpf]
     Fill Text                                      css=input[name=cep]                              ${dog_walker}[cep]
     Click                                          css=input[type=button][value$=CEP]    
    #validando os campos       
    Get Property                                   css=input[name=addressStreet]     value  equal   ${dog_walker}[addressStreet]   
    Get Property                                   css=input[name=addressDistrict]   value  equal   ${dog_walker}[addressDistrict]

    Get Property                                   css=input[name=addressCityUf]     value  equal   ${dog_walker}[addressCityUf]       

     Fill Text                                      css=input[name=addressNumber]                    ${dog_walker}[adressNumber]
     Fill Text                                      css=input[name=addressDetails]                   ${dog_walker}[addressDetails]    
#vai em inspecionar elemento e clica em Style e em elements styles,  
# #desabilita o checkbox elements.styles com o nome display: none;
#EXECDIR identifica qualquer arquivo que esteja na raiz do projeto que nesse caso a raiz é XQAEXPERIENCE 

    Upload File By Selector                        css=input[type=file]                             ${EXECDIR}/resources/fixtures/${dog_walker}[url]                        

Submit signup form  
    Click                                          css=.button-register   # Input Text  
    # # submit form                                   xpath=//*[@id="page-walker"]/form/button         Cadastrar     
Popup to be   
    [Arguments]       ${expected_text}
    Wait For Elements State                        css=.swal2-html-container       visible       5
    Get Text                                       css=.swal2-html-container        equal        ${expected_text}

    Screenshot.Take Screenshot        ${EXECDIR}/logs                        

    Sleep                                          60    #10
    #  #Capture Page Screenshot                        ${EXECDIR}/image  


#C:\Users\saonneto\UdemyAppiumAndRobotFramework-main\UdemyAppiumAndRobotFramework-main\XQAEXPERIENCE> 
# para roda basta digitar o comando 
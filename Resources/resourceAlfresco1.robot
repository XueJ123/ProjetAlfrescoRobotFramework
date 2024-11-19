*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../Locators/locatorsLoginDashbordPage.py
Variables    ../Locators/locatorsAdminPage.py
Variables    ../Locators/locatorsSitePage.py

*** Variables ***
${TIMEOUT}    120s
${vURL}    http://localhost:8088/share/page/
${vBrowser}    gc

*** Keywords ***
Log in Alfresco
    [Arguments]    ${vUsername}    ${vPassword}
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}
    Maximize Browser Window
    Input Text    ${txt_UserName}    ${vUsername}
    Input Password    ${txt_Password}    ${vPassword}
    Click Button    ${btn_Login}

Log Out Alfresco
    Click Element    id=HEADER_HOME_text
    Wait Until Element Is Visible    id=HEADER_USER_MENU_POPUP_text
    Click Element    id=HEADER_USER_MENU_POPUP_text
    Wait Until Element Is Visible    id=HEADER_USER_MENU_LOGOUT_text
    Click Element    id=HEADER_USER_MENU_LOGOUT_text

Init Date
    ${vDateSys}=    Get Current Date    exclude_millis=yes
    #${vDate}=    Get Substring    ${vDateSys}    0    10
    ${vYear}=    Get Substring    ${vDateSys}    0    4
    ${vMonth}=    Get Substring    ${vDateSys}    5    7
    ${vDate}=    Get Substring    ${vDateSys}    8    10
    ${vHeure}=    Get Substring    ${vDateSys}    11    13
    ${vMinute}=    Get Substring    ${vDateSys}     14    16
    ${vSeconde}=    Get Substring    ${vDateSys}    17    19
    ${vCompleteDate}=    catenate    ${vYear}${vMonth}${vDate}${vHeure}${vMinute}${vSeconde}
    [return]    ${vCompleteDate}

Vider corbeille
    #cliquer sur onglet Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    id=HEADER_SITES_MENU_MY_SITES_text
    #cliquer sur le lien Mes sites
    Click Element    id=HEADER_SITES_MENU_MY_SITES_text
    #wait until le lien Corbeille est visible
    Wait Until Element Is Visible    id=template_x002e_toolbar_x002e_user-sites_x0023_default-user-trashcan-link
    #cliquer sur le lien Corbeille
    Click Element    id=template_x002e_toolbar_x002e_user-sites_x0023_default-user-trashcan-link
    #wait unitl le bouton Vider est visible
    Wait Until Element Is Visible    id=template_x002e_user-trashcan_x002e_user-trashcan_x0023_default-empty-button-button
    #cliquer sur le bouton Vider
    Click Element    id=template_x002e_user-trashcan_x002e_user-trashcan_x0023_default-empty-button-button
    #wait unitl le bouton OK est visible
    Wait Until Element Is Visible    //div[@class='ft']/span/span[1]
    #cliquer sur le bouton OK
    Click Element    //div[@class='ft']/span/span[1]
    Sleep    5s

Creer un groupe
    [Arguments]    ${vGroupIdentifier}    ${vGroupName}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Groupe est visible
    Wait Until Element Is Visible    ${link_Groupes}
    #cliquer sur le lien Groupes
    Click Element    ${link_Groupes}
    #wait until le bouton Parcourir est visible
    Wait Until Element Is Visible    ${btn_Parcourir}
    #cliquer le bouton Parcourir
    Click Button    ${btn_Parcourir}
    #wait until le bouton + Nouveau groupe est visible
    Wait Until Element Is Visible    ${btn_NouveauGroupe}
    #cliquer sur icone + Nouveau groupe
    Click Element    ${btn_NouveauGroupe}
    #wait until le champ de saisr est visible
    Wait Until Element Is Visible    ${txt_IdentifiantNouveauGroupe}
    #sasir Identifiant de groupe
    Input Text    ${txt_IdentifiantNouveauGroupe}    ${vGroupIdentifier}
    #saisr nom de groupe
    Input Text    ${txt_NomNouveauGroupe}    ${vGroupName}
    #cliquer sur le bouton Creer un groupe
    Click Button    ${btn_CreerUnGroupe}
   
Supprimer un aspect
    [Arguments]    ${vNomModele}    ${vNomAspect}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Gestionnaire de modeles est visible
    Wait Until Element Is Visible    ${link_GestionnaireDeModeles}
    #cliquer sur le lien Gestionnaire de modeles
    Click Element    ${link_GestionnaireDeModeles}
    #wait until la page contains le lien de modele cible
    Wait Until Page Contains Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    #cliquer sur le nom de modele cible
    Click Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    Sleep    2s
    #wait until le bouton Action est visible
    Wait Until Element Is Visible    ${btn_ActionDeAspectCiblePart1}${vNomAspect}${btn_ActionDeAspectCiblePart2}
    #cliquer sur le menu Action de Aspect cible
    Click Element    ${btn_ActionDeAspectCiblePart1}${vNomAspect}${btn_ActionDeAspectCiblePart2}
    #wait until le lien Supprimer est visible
    Wait Until Element Is Visible    ${link_SupprimerAspect}
    #cliquer sur le lien Supprimer
    Click Element    ${link_SupprimerAspect}
    #wait until la page contain le bouton Supprimer
    Wait Until Page Contains Element    ${btn_SupprimerAspect}
    #cliquer sur le bouton Supprimer
    Click Element    ${btn_SupprimerAspect}

 Supprimer une propriete dans un type personnalise
    [Arguments]    ${vNomModele}    ${vNomType}    ${vNomPropriete}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Gestionnaire de modeles est visible
    Wait Until Element Is Visible    ${link_GestionnaireDeModeles}
    #cliquer sur le lien Gestionnaire de modeles
    Click Element    ${link_GestionnaireDeModeles}
    #wait until la page contains le lien de modele cible
    Wait Until Page Contains Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    #cliquer sur le nom de modele cible
    Click Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    Sleep    2s
    #wait until le bouton Action de Type cible est visible
    Wait Until Element Is Visible    ${link_TypeCiblePart1}${vNomType}${link_TypeCiblePart2}
    #cliquer sur le lien de Type cible
    Click Element    ${link_TypeCiblePart1}${vNomType}${link_TypeCiblePart2}
    #wait until le bouton Action de Propriete cible est visible
    Wait Until Element Is Visible    ${btn_ActionDeProprieteCiblePart1}${vNomPropriete}${btn_ActionDeProprieteCiblePart2}
    #cliquer sur le bouton Actions de Propriete cible
    Click Element    ${btn_ActionDeProprieteCiblePart1}${vNomPropriete}${btn_ActionDeProprieteCiblePart2}
    #wait until le lien Supprimer est visible
    Wait until Element Is Visible    ${link_SupprimerPropriete}
    #cliquer sur le lien Supprimer
    Click Element    ${link_SupprimerPropriete}
    #wait until la page contain le bouton Supprimer
    Wait Until Page Contains Element    ${btn_SupprimerPropriete}
    #cliquer sur le bouton Supprimer
    Click Element    ${btn_SupprimerPropriete}

Creer un site
    [Arguments]    ${vNomSite}    ${vUrlSite}    ${vDescription}
    Wait Until Element Is Visible    ${link_HeaderSites}
    Click Element    ${link_HeaderSites}
    Wait Until Element Is Visible    ${link_HeaderCreerUnSite}
    Click Element    ${link_HeaderCreerUnSite}
    Wait Until Element Is Visible    ${list_CreerSiteType}
    Sleep    3s
    Click Element    ${list_CreerSiteType}
    Wait Until Element Is Visible    ${list_CreerSiteTypeElement1}
    Click Element    ${list_CreerSiteTypeElement1}
    Input Text    ${txt_CreerSiteTitle}    ${vNomSite}
    Input Text    ${txt_CreerSiteShortName}    ${vUrlSite}
    Input Text    ${txt_CreerSiteDescription}    ${vDescription}
    Sleep    1s
    Click Element    ${btn_CreerSiteCreer}

Creer un site prive
    [Arguments]    ${vNomSite}    ${vUrlSite}    ${vDescriptionSite}
    #cliquer sur le lien Sites
    Click Element    id=HEADER_SITES_MENU_text
    #wait until le lien Creer un site est visible
    Wait Until Element Is Visible    id=HEADER_SITES_MENU_CREATE_SITE_text
    #cliquer sur le lien Creer un site
    Click Element    id=HEADER_SITES_MENU_CREATE_SITE_text
    Sleep    2s
    #saisir les donnees de formulaire
    Input Text  //div[@id='CREATE_SITE_FIELD_TITLE']/div[2]/div/div/div[2]/input    ${vNomSite}
    Input Text  //div[@id='CREATE_SITE_FIELD_SHORTNAME']/div[2]/div/div/div[2]/input    ${vUrlSite}
    Input Text    //div[@id='CREATE_SITE_FIELD_DESCRIPTION']/div[2]/div/textarea    ${vDescriptionSite}
    Select Radio Button    visibility    PRIVATE
    #cliquer sur le boutton Creer
    Click Element    id=CREATE_SITE_DIALOG_OK_label

Supprimer un site
    [Arguments]    ${vNomSite}
    #cliquer sur onglet Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    id=HEADER_SITES_MENU_MY_SITES_text
    #cliquer sur le lien Mes sites
    Click Element    id=HEADER_SITES_MENU_MY_SITES_text
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    xpath=//a[text()='${vNomSite}']
    #cliquer sur le lien du site cible
    Click Element    xpath=//a[text()='${vNomSite}']
    #wait until le boutton configuration est visible
    Wait Until Element Is Visible    id=HEADER_SITE_CONFIGURATION_DROPDOWN
    #cliquer sur le boutton configuration
    Click Element    id=HEADER_SITE_CONFIGURATION_DROPDOWN
    #waint until le lien Supprimer le site est visible
    Wait Until Element Is Visible    id=HEADER_DELETE_SITE_text
    #cliquer sur le lien Supprimer le site
    Click Element    id=HEADER_DELETE_SITE_text
    #wait until le boutton OK est visible
    Wait Until Element Is Visible    id=ALF_SITE_SERVICE_DIALOG_CONFIRMATION_label
    #cliquer sur le boutton OK
    Click Element    id=ALF_SITE_SERVICE_DIALOG_CONFIRMATION_label

Creer une liste de donnees
    #vTypeListe = 1: Agenda evenement, 2:Cartnet adress, 3:Liste evenement, 4:Liste contact, 5:Liste publication, 6:Liste tache
    # 7:Liste tache avancee, 7:Liste tache simple, 9:Ordre du jour
    [Arguments]    ${vNomSite}    ${vTypeListe}    ${vNomListeDonnees}    ${vDescriptionListeDonnees}
    Wait Until Element Is Visible    ${link_HeaderSites}
    #cliquer sur onglet Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    id=HEADER_SITES_MENU_MY_SITES_text
    #cliquer sur le lien Mes sites
    Click Element    id=HEADER_SITES_MENU_MY_SITES_text
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    xpath=//a[text()='${vNomSite}']
    #cliquer sur le lien du site cible
    Click Element    xpath=//a[text()='${vNomSite}']
    #wait until la page de site cible affiche
    Wait Until Page Contains Element    xpath=//span[@title='${vNomSite}']
    #cliquer sur le lien Listes de donnees
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    id=HEADER_SITE_DATA-LISTS_text
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    id=HEADER_SITE_MORE_PAGES_text
    #wait until le lien Listes de donnees est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    id=HEADER_SITE_DATA-LISTS_text
    #cliquer sur le lien Listes de donnees
    Run Keyword If    '${statut}'=='FAIL'    Click Element    id=HEADER_SITE_DATA-LISTS_text
    Sleep    4s
    
    #wait until le bouton Nouvelle liste est visible
    #Wait Until Element Is Visible    id=template_x002e_datalists_x002e_data-lists_x0023_default-newListButton-button
    #cliquer sur bouton Nouvelle liste
    #Click Button    id=template_x002e_datalists_x002e_data-lists_x0023_default-newListButton-button
    #waint until le type est visible
    Wait Until Element Is Visible    //div[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList-itemTypesContainer']/div[${vTypeListe}]
    #cliquer et selectionner un type
    Click Element    //div[@id='template_x002e_datalists_x002e_data-lists_x0023_default-newList-itemTypesContainer']/div[${vTypeListe}]
    #saisir le titre de liste
    Input Text    xpath=//input[@name='prop_cm_title']    ${vNomListeDonnees}
    #saisir description de liste
    Input Text    xpath=//textarea[@name='prop_cm_description']    ${vDescriptionListeDonnees}
    #cliquer sur le bouton Enregistrer
    Click Button    id=template_x002e_datalists_x002e_data-lists_x0023_default-newList-form-submit-button

Supprimer une liste de donnees
    [Arguments]    ${vNomSite}    ${vNomListeDonnees}
    #cliquer sur onglet Sites
    Click Element    ${link_HeaderSites}
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    id=HEADER_SITES_MENU_MY_SITES_text
    #cliquer sur le lien Mes sites
    Click Element    id=HEADER_SITES_MENU_MY_SITES_text
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    xpath=//a[text()='${vNomSite}']
    #cliquer sur le lien du site cible
    Click Element    xpath=//a[text()='${vNomSite}']
    #wait until la page de site cible affiche
    Wait Until Page Contains Element    xpath=//span[@title='${vNomSite}']
    #cliquer sur le lien Listes de donnees
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    id=HEADER_SITE_DATA-LISTS_text
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    id=HEADER_SITE_MORE_PAGES_text
    #wait until le lien Listes de donnees est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    id=HEADER_SITE_DATA-LISTS_text
    #cliquer sur le lien Listes de donnees
    Run Keyword If    '${statut}'=='FAIL'    Click Element    id=HEADER_SITE_DATA-LISTS_text
    Sleep    2s
    #wait until le lien du liste cible est visible
    Wait Until Element Is Visible    //div[@id='template_x002e_datalists_x002e_data-lists_x0023_default-lists']//a[text()='${vNomListeDonnees}']
    #survoler le souris sur le lien du liste cible
    Mouse Over    //div[@id='template_x002e_datalists_x002e_data-lists_x0023_default-lists']//a[text()='${vNomListeDonnees}']
    #wait until icone supprimer est visible
    Wait Until Element Is Visible    xpath=//a[contains(.,'${vNomListeDonnees}')]/span[@class='delete']
    #cliquer sur icone edit
    Click Element    xpath=//a[contains(.,'${vNomListeDonnees}')]/span[@class='delete']
    Sleep    2s
    #wait until le bouton Supprimer est visible
    Wait Until Element Is Visible    //div[@class='ft']/span/span[1]
    #cliquer sur le boutton Supprimer
    Click Element    //div[@class='ft']/span/span[1]

Creer un compte utilisateur
    [Arguments]    ${vPrenomUser}    ${vEmailUser}    ${vNomUser}    ${vPasswordUser}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Gestionnaire de modeles est visible
    Wait Until Element Is Visible    xpath=//a[@href='users']
    #cliquer sur le lien Gestionnaire de modeles
    Click Element    xpath=//a[@href='users']
    #wait until le bouton Nouvel utilisateur est visible
    Wait Until Element Is Visible    id=page_x002e_ctool_x002e_admin-console_x0023_default-newuser-button-button
    #cliquer sur le bouton Nouvel utilisateur
    Click Button    id=page_x002e_ctool_x002e_admin-console_x0023_default-newuser-button-button
    #wait until le champ de Prenom est visible
    Wait Until Element Is Visible    id=page_x002e_ctool_x002e_admin-console_x0023_default-create-firstname
    #Saisir les donnees
    Input Text    id=page_x002e_ctool_x002e_admin-console_x0023_default-create-firstname    ${vPrenomUser}
    Input Text    id=page_x002e_ctool_x002e_admin-console_x0023_default-create-email    ${vEmailUser}
    Input Text    id=page_x002e_ctool_x002e_admin-console_x0023_default-create-username    ${vNomUser}
    Input Text    id=page_x002e_ctool_x002e_admin-console_x0023_default-create-password    ${vPasswordUser}
    Input Text    id=page_x002e_ctool_x002e_admin-console_x0023_default-create-verifypassword    ${vPasswordUser}
    #cliquer sur le bouton Creer un utilisateur
    Scroll Element Into View    id=page_x002e_ctool_x002e_admin-console_x0023_default-createuser-ok-button-button
    Click Button    id=page_x002e_ctool_x002e_admin-console_x0023_default-createuser-ok-button-button
    Sleep    3s

Supprimer un compte utilisateur
    [Arguments]    ${vPrenomUser}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Gestionnaire de modeles est visible
    Wait Until Element Is Visible    xpath=//a[@href='users']
    #cliquer sur le lien Gestionnaire de modeles
    Click Element    xpath=//a[@href='users']
    #wait until le champ de rechercher est visible
    Wait Until Element Is Visible    id=page_x002e_ctool_x002e_admin-console_x0023_default-search-text
    #saisir le prenom de utilisateur
    Input Text    id=page_x002e_ctool_x002e_admin-console_x0023_default-search-text    ${vPrenomUser}
    #wait until le bouton Rchercher est visible
    Wait Until Element Is Visible    id=page_x002e_ctool_x002e_admin-console_x0023_default-search-button-button
    #cliquer sur le bouton Rchercher
    Click Button    id=page_x002e_ctool_x002e_admin-console_x0023_default-search-button-button
    #wait until le lien de utilisateur cible est visible
    Wait Until Element Is Visible    xpath=//a[contains(.,'${vPrenomUser}')]
    #cliquer sur le lien de utilisateur cible
    Click Element    xpath=//a[contains(.,'${vPrenomUser}')]
    #wait until le bouton Supprimer un utilisateur est visible
    Wait Until Element Is Visible    id=page_x002e_ctool_x002e_admin-console_x0023_default-deleteuser-button-button
    #cliquer sur le bouton 
    Click Button    id=page_x002e_ctool_x002e_admin-console_x0023_default-deleteuser-button-button
    #wait until le bouton Supprimer est visible
    Wait Until Element Is Visible    //div[@class='ft']/span/span[1]
    #cliquer sur le bouton Supprimer
    Click Element    //div[@class='ft']/span/span[1]

Creer un article dans le blog du site
    [Arguments]    ${vNomSite}    ${vTitreArticle}    ${vTexteArticle}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur le lien Sites
    Click Element    id=HEADER_SITES_MENU_text
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    id=HEADER_SITES_MENU_MY_SITES_text
    #cliquer sur le lien Mes sites
    Click Element    id=HEADER_SITES_MENU_MY_SITES_text
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    xpath=//a[text()='${vNomSite}']
    Sleep    3s
    #cliquer sur le lien du site cible
    Click Element    xpath=//a[text()='${vNomSite}']
    Sleep    3s
    #wait until la page de site cible affiche
    Wait Until Page Contains Element    xpath=//span[@title='${vNomSite}']
    Reload Page
    Sleep    3s
    #cliquer sur le lien Blog
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    id=HEADER_SITE_BLOG-POSTLIST_text
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    id=HEADER_SITE_MORE_PAGES_text
    #wait until le lien Blog est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    id=HEADER_SITE_BLOG-POSTLIST_text
    #cliquer sur le lien Blog
    Run Keyword If    '${statut}'=='FAIL'    Click Element    id=HEADER_SITE_BLOG-POSTLIST_text
    Sleep    2s
    #wait until le bouton Nouvel article est visible
    Wait Until Element Is Visible    id=template_x002e_toolbar_x002e_blog-postlist_x0023_default-create-button-button
    #cliquer sur le bouton Nouvel article
    Click Button    id=template_x002e_toolbar_x002e_blog-postlist_x0023_default-create-button-button
    #wait until le champ de titre est visible
    Wait Until Element Is Visible    id=template_x002e_postedit_x002e_blog-postedit_x0023_default-title
    #saisir le champ Titre
    Input Text    id=template_x002e_postedit_x002e_blog-postedit_x0023_default-title    ${vTitreArticle}
    Select Frame    id=template_x002e_postedit_x002e_blog-postedit_x0023_default-content_ifr
    Sleep    2s
    #saisir le champ Texte
    Input Text    xpath=//p    ${vTexteArticle}
    Unselect Frame
    #cliquer sur le bouton Publier en interne
    Click Button    id=template_x002e_postedit_x002e_blog-postedit_x0023_default-publish-button-button

Supprimer un article dans un blog
    [Arguments]    ${vNomSite}    ${vTitreArticle}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur le lien Sites
    Click Element    id=HEADER_SITES_MENU_text
    #wait until le lien Mes sites est visible
    Wait Until Element Is Visible    id=HEADER_SITES_MENU_MY_SITES_text
    #cliquer sur le lien Mes sites
    Click Element    id=HEADER_SITES_MENU_MY_SITES_text
    #wait until le lien du site cible est visible
    Wait Until Element Is Visible    xpath=//a[text()='${vNomSite}']
    #cliquer sur le lien du site cible
    Click Element    xpath=//a[text()='${vNomSite}']
    Sleep    3s
    #cliquer sur le lien Blog
    ${statut}    ${value}=    Run Keyword And Ignore Error    Click Element    id=HEADER_SITE_BLOG-POSTLIST_text
    #si il y a error, cliquer sur le lien Plus
    Run Keyword If    '${statut}'=='FAIL'    Click Element    id=HEADER_SITE_MORE_PAGES_text
    #wait until le lien Blog est visible
    Run Keyword If    '${statut}'=='FAIL'    Wait Until Element Is Visible    id=HEADER_SITE_BLOG-POSTLIST_text
    #cliquer sur le lien Blog
    Run Keyword If    '${statut}'=='FAIL'    Click Element    id=HEADER_SITE_BLOG-POSTLIST_text
    Sleep    2s
    #wait until le lien Tous est visible
    Wait Until Element Is Visible    xpath=//span[@class='all']
    #cliquer sur le lien Tous
    Click Element    xpath=//span[@class='all']
    #wait until le lien de article est visible
    Wait Until Element Is Visible    xpath=//a[text()='${vTitreArticle}']
    Sleep    2s
    #survoler le souris sur le titre de article
    Mouse Over    xpath=//a[text()='${vTitreArticle}']
    #wait until le lien de supprimer est visible
    Wait Until Element Is Visible    //div[@class='onDeleteBlogPost']/a
    #cliquer sur le lien de supprimer est visible
    Click Element    //div[@class='onDeleteBlogPost']/a
    #wait until le bouton Supprimer est visible
    Wait Until Element Is Visible    //div[@class='ft']/span/span[1]
    #cliquer sur le bouton Supprimer
    Click Element    //div[@class='ft']/span/span[1]

Creer un dossier
    [Arguments]    ${vNomDossier}
    Set Selenium Timeout    ${TIMEOUT}
    #wait until onglet Mes fichiers est visible
    Wait Until Element Is Visible    id=HEADER_MY_FILES_text
    #cliquer sur le onglet Mes fichiers
    Click Element    id=HEADER_MY_FILES_text
    #wait until le lien Creer... est visible
    Wait Until Element Is Visible    //span[@id='template_x002e_documentlist_v2_x002e_myfiles_x0023_default-createContent-button']/span/button
    #cliquer sur le lien Creer...
    Click Button    //span[@id='template_x002e_documentlist_v2_x002e_myfiles_x0023_default-createContent-button']/span/button
    #wait until le lien Dossier est visible
    Wait Until Element Is Visible    xpath=//span[@class='folder-file']
    #cliquer sur le lien Dossier
    Click Element    xpath=//span[@class='folder-file']
    #wait until le champ Nom est visible
    Wait Until Element Is Visible    id=template_x002e_documentlist_v2_x002e_myfiles_x0023_default-createFolder_prop_cm_name
    #saisir le nome de dossier
    Input Text    id=template_x002e_documentlist_v2_x002e_myfiles_x0023_default-createFolder_prop_cm_name    ${vNomDossier}
    #cliquer sur le bouton Enregistrer
    Click Button    id=template_x002e_documentlist_v2_x002e_myfiles_x0023_default-createFolder-form-submit-button

Supprimer un dossier
    [Arguments]    ${vNomDossier}
    Set Selenium Timeout    ${TIMEOUT}
    #wait until la page contient le champ de recherche
    Wait Until Page Contains Element    id=HEADER_SEARCHBOX_FORM_FIELD
    #saisir le nom de dossier dans le champ de recherche
    Input Text    id=HEADER_SEARCHBOX_FORM_FIELD    ${vNomDossier}
    #presser return sur le clavier
    Press Keys    id=HEADER_SEARCHBOX_FORM_FIELD    RETURN
    #wait until le nom de dossier cible est visible
    Wait Until Element Is Visible    xpath=(//*[text()='${vNomDossier}'])[1]
    #survoler souris sur le nom de dossier cible
    Mouse Over    xpath=(//*[text()='${vNomDossier}'])[1]
    #wait until le bouton Actions est visible
    Wait Until Element Is Visible    xpath=(//*[text()='${vNomDossier}']//ancestor::tr/td[@class='actionsCell']/div)[1]
    #cliquer sur le bouton Actions
    Click Element    xpath=(//*[text()='${vNomDossier}']//ancestor::tr/td[@class='actionsCell']/div)[1]
    #wait until le lien Supprimer le dossier est visible
    Wait Until Element Is Visible    id=FCTSRCH_SEARCH_RESULT_ACTIONS_document-delete_text
    #cliquer sur le lien Supprimer le dossier
    Click Element    id=FCTSRCH_SEARCH_RESULT_ACTIONS_document-delete_text
    #wait until le bouton Supprimer est visible
    Wait Until Element Is Visible    id=ALF_DELETE_CONTENT_DIALOG_CONFIRMATION_label
    #cliquer sur le bouton Supprimer
    Click Element    id=ALF_DELETE_CONTENT_DIALOG_CONFIRMATION_label
    Sleep    2s
    #wait until le nom de dossier cible est visible
    Wait Until Element Is Visible    xpath=//*[text()='${vNomDossier}']
    #survoler souris sur le nom de dossier cible
    Mouse Over    xpath=//*[text()='${vNomDossier}']
    #wait until le bouton Actions est visible
    Wait Until Element Is Visible    xpath=//*[text()='${vNomDossier}']//ancestor::tr/td[@class='actionsCell']/div
    #cliquer sur le bouton Actions
    Click Element    xpath=//*[text()='${vNomDossier}']//ancestor::tr/td[@class='actionsCell']/div
    #wait until le lien Supprimer le dossier est visible
    Wait Until Element Is Visible    id=FCTSRCH_SEARCH_RESULT_ACTIONS_document-delete_text
    #cliquer sur le lien Supprimer le dossier
    Click Element    id=FCTSRCH_SEARCH_RESULT_ACTIONS_document-delete_text
    #wait until le bouton Supprimer est visible
    Wait Until Element Is Visible    id=ALF_DELETE_CONTENT_DIALOG_CONFIRMATION_label
    #cliquer sur le bouton Supprimer
    Click Element    id=ALF_DELETE_CONTENT_DIALOG_CONFIRMATION_label

Creer un type personnalise
    [Arguments]    ${vNomModele}    ${vNomType}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Gestionnaire de modeles est visible
    Wait Until Element Is Visible    ${link_GestionnaireDeModeles}
    #cliquer sur le lien Gestionnaire de modeles
    Click Element    ${link_GestionnaireDeModeles}
    #wait until la page contains le lien de modele cible
    Wait Until Page Contains Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    #cliquer sur le nom de modele cible
    Click Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    Sleep    2s
    #wait until le boutton Creer un type personnalise
    Wait Until Element Is Visible    //div[@id='dijit_layout_ContentPane_1']/div/div[4]/div/div/span[2]
    #cliquer sur le boutton Creer un type personnalise
    Click Element    //div[@id='dijit_layout_ContentPane_1']/div/div[4]/div/div/span[2]
    #wait until le champ Nom est visible
    Wait Until Element Is Visible    xpath=(//div[@class='dialog-body']/div/div/form)[1]//input[@name='name']
    #saisir Nom de type
    Input Text    xpath=(//div[@class='dialog-body']/div/div/form)[1]//input[@name='name']    ${vNomType}
    #cliquer sur le bouton Creer
    Click Element    id=CMM_CREATE_TYPE_DIALOG_OK_label

Supprimer un type personnalise
    [Arguments]    ${vNomModele}    ${vNomType}
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer sur onglet Outil admin
    Click Element    ${link_HeaderOutilsAdmin}
    #wait until le lien Gestionnaire de modeles est visible
    Wait Until Element Is Visible    ${link_GestionnaireDeModeles}
    #cliquer sur le lien Gestionnaire de modeles
    Click Element    ${link_GestionnaireDeModeles}
    #wait until la page contains le lien de modele cible
    Wait Until Page Contains Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    #cliquer sur le nom de modele cible
    Click Element    ${link_NomDeModeleCiblePart1}${vNomModele}${link_NomDeModeleCiblePart2}
    Sleep    2s
    #wait until le bouton action de type cible est visible
    Wait Until Element Is Visible    //div[@id='TYPES_LIST']/div[3]/div/table/tbody/tr[td[contains(.,'${vNomModele}:${vNomType}')]]/td[5]/div/div/div/span/span
    #cliquer sur le bouton action de type cible
    Click Element    //div[@id='TYPES_LIST']/div[3]/div/table/tbody/tr[td[contains(.,'${vNomModele}:${vNomType}')]]/td[5]/div/div/div/span/span
    #wait until le lien Supprimer est visible
    Wait Until Element Is Visible    //div[@class='dijitPopup Popup'][1]/div/div/div/table/tbody/tr[3]/td[2]
    #cliquer sur le lien Supprimer
    Click Element    //div[@class='dijitPopup Popup'][1]/div/div/div/table/tbody/tr[3]/td[2]
    #wait until le bouton Supprimer est visible
    Wait Until Element Is Visible    //div[@class='dijitDialogPaneContent']/div[2]/span[1]/span/span/span[3]
    #cliquer sur le bouton Supprimer
    Click Element    //div[@class='dijitDialogPaneContent']/div[2]/span[1]/span/span/span[3]

Create Un Site Complet
    #Visibility est option de visibilite du site a creer.
    #Pour visibilite "Public" ecrire en majuscule: PUBLIC
    #Pour visibilite "Modere" ecrire en majuscule: MODERATED
    #Pour visibilite "Liste privee" ecrire en majuscule: PRIVATE
    [Arguments]    ${title}    ${url}    ${description}    ${visibility}
    Click Element    ${link_HeaderSites}
    Wait Until Element Is Visible    ${link_HeaderCreerUnSite}
    Click Element    ${link_HeaderCreerUnSite}
    Wait Until Element Is Visible    ${list_CreerSiteType}
    Sleep    3s
    Click Element    ${list_CreerSiteType}
    Click Element    ${list_CreerSiteTypeElement1}
    Input Text    ${txt_CreerSiteTitle}    ${title}
    Input Text    ${txt_CreerSiteShortName}    ${url}
    Input Text    ${txt_CreerSiteDescription}    ${description}
    Click Element    ${btn_VisibilityPart1}${visibility}${btn_VisibilityPart2}
    Sleep    1s
    Click Element    ${btn_CreerSiteCreer}
    Sleep    3s
    #AjouterElementsite
    Click Element    ${img_SiteConfiguration}
    Sleep    3s
    Click Element    ${link_personnaliserSite}
    Sleep    3s
    Drag And Drop    ${img_BlogPage}    ${target_dropplace}
    Sleep    2s
    Drag And Drop    ${img_LiensPage}    ${target_dropplace}
    Sleep    2s
    Drag And Drop    ${img_ListeDoneesPage}    ${target_dropplace}
    Sleep    2s
    Drag And Drop By Offset    ${img_DiscussionPage}    700    200
    Sleep    2s
    Drag And Drop By Offset    ${img_WikiPage}    800    200
    Sleep    2s
    Drag And Drop By Offset    ${img_CalendrierPage}    1000    200
    Sleep    3s
    Click Button    ${btn_OkPersonnalierSite}
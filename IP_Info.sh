#! /usr/bin/env bash                                                                            
# ===================================================
# IP Info - By : 3xpl0it Sh4d0w - Copyleft : 2021.
# ===================================================
# Date de Création      : 12-08-2021.
# Date de Modification  : 28-08-2021.
# ===================================================


Check_PKGS()
{
    PKGS="curl cat jq"

    check_pkgs=$(which $PKGS)

    if [ $? != 0 ]; 
    then
        clear
        printf "Erreur : \n"
        printf "Il manque des Dépendances."
        read -p "Voulez-vous les Installer ? [O - N] : " oui_non

        case ${oui_non} in
            "o"|"O"|"oui"|"OUI")
                apt-get install ${PKGS} -y
            ;;
            "n"|"N"|"non"|"NON")
                printf "Vous ne pouvez pas utiliser le script sans les Dépandances."
                exit 1
            ;;
        esac
    fi
}   


Banner_IP_INFO()
{
    clear

    printf "================================================= \n"   
    printf "[ ██╗██████╗     ██╗███╗   ██╗███████╗ ██████╗  ] \n"
    printf "[ ██║██╔══██╗    ██║████╗  ██║██╔════╝██╔═══██╗ ] \n"
    printf "[ ██║██████╔╝    ██║██╔██╗ ██║█████╗  ██║   ██║ ] \n"
    printf "[ ██║██╔═══╝     ██║██║╚██╗██║██╔══╝  ██║   ██║ ] \n"
    printf "[ ██║██║         ██║██║ ╚████║██║     ╚██████╔╝ ] \n"
    printf "[ ╚═╝╚═╝         ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝  ] \n"
    printf "================================================= \n"   
}


Run_IP_INFO()
{
    REQUEST="curl -s"
    JSON_PARSE="jq -r"

    KEY=$(cat API_KEY)
    API="https://geo.ipify.org/api/v1?apiKey=${KEY}"


    IPV4=$($REQUEST ${API} | $JSON_PARSE ".ip")
    CITY=$($REQUEST $API | $JSON_PARSE ".location.city")
    COUNTRY=$($REQUEST $API | $JSON_PARSE ".location.country")
    REGION=$($REQUEST $API | $JSON_PARSE ".location.region")
    # POSTALCODE=$($REQUEST $API | $JSON_PARSE ".location.postalCode")
    FAI_LAT=$($REQUEST $API | $JSON_PARSE ".location.lat")
    FAI_LNG=$($REQUEST $API | $JSON_PARSE ".location.lng")
    FAI_NAME=$($REQUEST $API | $JSON_PARSE ".as.name")
    FAI_TYPE=$($REQUEST $API | $JSON_PARSE ".as.type")
    FAI_ROUTE=$($REQUEST $API | $JSON_PARSE ".as.route")
    # FAI_DOMAIN=$($REQUEST $API | $JSON_PARSE ".domains.0")
    # FAI_ISP=$($REQUEST $API | $JSON_PARSE ".isp")


    printf "IP          : $IPV4 \n"
    printf "Pays        : $COUNTRY \n"
    printf "Région      : $REGION \n"    
    printf "Ville       : $CITY \n"
    # printf "Code Postal : $POSTALCODE \n"
    printf "Latitude    : $FAI_LAT \n"  
    printf "Longitude   : $FAI_LNG \n"

    printf "FAI         : $FAI_NAME \n"
    printf "Type        : $FAI_TYPE \n"
    printf "Route       : $FAI_ROUTE \n"
    # printf "Domaine FAI : $FAI_DOMAIN \n"

    printf "================================================= \n"   
}

Check_PKGS
Banner_IP_INFO
Run_IP_INFO

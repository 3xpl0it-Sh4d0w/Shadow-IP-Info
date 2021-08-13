#! /usr/bin/env bash                                                                            
# ===================================================
# IP Info - By : 3xpl0it Sh4d0w - Copyleft : 2021.
# ===================================================
# Date de Création      : 12-08-2021.
# Date de Modification  : 13-08-2021.
# ===================================================


API_IPV4="api.ipify.org?format=json"
API_IPV6="api64.ipify.org?format=json"
API_GEOIP="geo.ipify.org/api/v1?apiKey=at_8UuJh6Y6H7oMgFAXQ9GZqQBwV2E6q"

JSON_PARSE="jq -r"


Banner_IP_Info()
{
    printf "================================================= \n"   
    printf "[ ██╗██████╗     ██╗███╗   ██╗███████╗ ██████╗  ] \n"
    printf "[ ██║██╔══██╗    ██║████╗  ██║██╔════╝██╔═══██╗ ] \n"
    printf "[ ██║██████╔╝    ██║██╔██╗ ██║█████╗  ██║   ██║ ] \n"
    printf "[ ██║██╔═══╝     ██║██║╚██╗██║██╔══╝  ██║   ██║ ] \n"
    printf "[ ██║██║         ██║██║ ╚████║██║     ╚██████╔╝ ] \n"
    printf "[ ╚═╝╚═╝         ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝  ] \n"
    printf "================================================= \n"       
}

MENU_IP_INFO()
{
    clear
    Banner_IP_Info
    printf "[ 1 ] Obtenir Infos sur votre IP Publique. \n"
    printf "[ 2 ] Obtenir Infos sur une IP Publique Saisie. \n"
    printf "================================================= \n"
    read -p "[ ! ] Veuillez choisir une Option : " Option
    
    case $Option in
        "1")
            View_Your_IP_Info
        ;;
        "2")
            View_Other_IP_Info
        ;;
        *)
            ./IP-Info.sh
        ;;
    esac
}

View_Your_IP_Info()
{
    clear
    Banner_IP_Info
    echo "IPV4      :" $(curl -s $API_IPV4 | $JSON_PARSE ".ip")
    echo "Latitude  :" $(curl -s $API_GEOIP | $JSON_PARSE ".location.lat")
    echo "Longitude :" $(curl -s $API_GEOIP | $JSON_PARSE ".location.lng")
}

View_Other_IP_Info()
{
    printf "Cette Option arrive bientôt."
}

MENU_IP_INFO
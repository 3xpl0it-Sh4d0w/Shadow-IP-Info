#! /usr/bin/env bash                                                                            
# ===================================================
# IP Info - By : 3xpl0it Sh4d0w - Copyleft : 2021.
# ===================================================
# Date de Création      : 12-08-2021.
# Date de Modification  : 17-06-2022.
# ===================================================


# Check_PKGS()
# {
#    PKGS="curl cat jq"

#    check_pkgs=$(which $PKGS)

#    if [[ "$?" == "1" ]]; 
#        then
#            clear
#            printf "[-] Il manque des Dépendances. \n"
#            read -p "[+] Voulez-vous les Installer ? [O - N] : " oui_non

#            case ${oui_non} in
#                "o"|"O"|"oui"|"OUI")
#                    apt-get install ${PKGS} -y
#                ;;
#                "n"|"N"|"non"|"NON")
#                    printf "[-] Vous ne pouvez pas utiliser le script sans les Dépandances. \n"
#                exit 1
#                ;;
#            esac
#    fi
# }   

REQUEST="curl -s"
JSON_PARSE="jq -r"

API_KEY=""
API="https://geo.ipify.org/api/v1?apiKey=${API_KEY}"

GET_IPV4=$($REQUEST ${API} | $JSON_PARSE ".ip")
GET_CITY=$($REQUEST $API | $JSON_PARSE ".location.city")
GET_COUNTRY=$($REQUEST $API | $JSON_PARSE ".location.country")
GET_REGION=$($REQUEST $API | $JSON_PARSE ".location.region")
# GET_POSTALCODE=$($REQUEST $API | $JSON_PARSE ".location.postalCode")
GET_FAI_LAT=$($REQUEST $API | $JSON_PARSE ".location.lat")
GET_FAI_LNG=$($REQUEST $API | $JSON_PARSE ".location.lng")
GET_FAI_NAME=$($REQUEST $API | $JSON_PARSE ".as.name")
GET_FAI_TYPE=$($REQUEST $API | $JSON_PARSE ".as.type")
GET_FAI_ROUTE=$($REQUEST $API | $JSON_PARSE ".as.route")
# GET_FAI_DOMAIN=$($REQUEST $API | $JSON_PARSE ".domains.0")
# GET_FAI_ISP=$($REQUEST $API | $JSON_PARSE ".isp")

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
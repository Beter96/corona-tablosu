#!/bin/bash

#######################################################################
# BU PROJE BAZI SEBEPLERDEN ÖTÜRÜ ARTIK GEÇERSİZDİR(artık çlaışmıyor) #
# YİNEDE SOURCE CODE U İNCELEMEK İSTERSENİZ DOWNLOAD EDEBİLİRSİNİZ    #
#######################################################################

## EVDE KAL ##
# sosyal mesafe - maske - hijyen
## *-*-* ##
#########################
# a script by lazy-pwny #
#########################

# renkler
    beyaz="\033[1;37m"
    gri="\033[0;37m"
    morq="\033[0;35m"
    kirmizi="\033[1;31m"
    yesil="\033[1;32m"
    sari="\033[1;33m"
    ciyan="\033[0;36m"
    kr="\033[0;33m"
    fiusa="\033[0;35m"
    mavi="\033[1;34m"
    tp="\e[0m"
    blink='\e[5m'

# variable?
datetoday=$(date | awk '{print $1,$3,$4" / "}')
# üstad Dr Fahrettin Koca ve bazı güzel sözleri

function banner {
    randx=$(( RANDOM % 10 ))
    echo -e "${ciyan}*${tp} Dr. Fahrettin Koca ${ciyan}*${tp}"
    if [[ $randx = "1" ]] ; then
    echo -e "[${blink}${sari}*${tp}] COVID-19’la mücadeleyi hastalığa yakalanmış olanlara bırakmayın. Tedbir alın.\n"
    elif [[ $randx = "2" ]] ; then
    echo -e "[${blink}${sari}*${tp}] Her adımda risk mesafesini ayarlayın.\n"
    elif [[ $randx = "3" ]] ; then
    echo -e "[${blink}${sari}*${tp}] Kolaya kaçarsak, zoru birlikte yaşarız. Tedbir alın.\n"
    elif [[ $randx = "4" ]] ; then
    echo -e "[${blink}${sari}*${tp}] Koronavirüsle mücadelede katedeceğimiz bütün mesafe 1,5 metredir. (Maske takmak şartıyla.)\n"
    elif [[ $randx = "5" ]] ; then
    echo -e "[${blink}${sari}*${tp}]  M  e  s  a  f  e   k  u  r  a  l  ı  n  a   u y a l ı m\nKuralıuygulamasızorortamagirmeyelim\n"
    elif [[ $randx = "6" ]] ; then
    echo -e "[${blink}${sari}*${tp}] Aramızda dağlar yok. Mesafeyi ayarlayın. Hastalık, sadece kurallara uyanı uymayandan ayırıyor.\n"
    elif [[ $randx = "7" ]] ; then
    echo -e "[${blink}${sari}*${tp}] 64 YAŞ VE ALTI iki kat tedbirli olmalı. Bir büyükleri, bir kendileri için.\n"
    elif [[ $randx = "8" ]] ; then
    echo -e "[${blink}${sari}*${tp}] COVID-19’a karşı kenetlenin: Aranıza mesafe koyun!\n"
    elif [[ $randx = "9" ]] ; then
    echo -e "[${blink}${sari}*${tp}] Tatilde ve bayramda herkesle iç içe olanlar 1,5 m geri çekilsin.\n"
    elif [[ $randx = "10" ]] ; then
    echo -e "_o_  ${blink}${yesil}*${tp}  ${blink}${yesil}*${tp}      ${blink}${yesil}*${tp}      _o_"
    echo -e " | ${blink}${yesil}*${tp} <--1,5 metre--> ${blink}${yesil}*${tp} |"
    echo -e "/ \  ${blink}${yesil}*${tp}   ${blink}${yesil}*${tp}    ${blink}${yesil}*${tp}  ${blink}${yesil}*${tp}    / \ "
    else
    echo -e "[${blink}${sari}*${tp}] Maskesiz? Görenler ne der?\n"
    fi
}

## internet varmı bro? ##
wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo "Online" &> /dev/null  
else
    echo -e "[${blink}${mavi}*${tp}] Offline"
    echo "cihazınız internete bağlı olmadığından güncel bilgi alınamıyor.."
    banner
    exit 1
fi

# satır bilgisi
lines=$(wget covid19.saglik.gov.tr -q -O - | grep -n "BUGÜNKÜ" | awk '{print $1}' | tr -d ":")

# günlük test sayısı
test=$(echo $lines | awk '{print $1}')
test2=$(( $test + 2 ))
todaytest=$(wget covid19.saglik.gov.tr -q -O - | awk NR=="${test2}" | awk '{print $2}' | tr -dc '.0-9')

# günlük hasta sayısı
hasta=$(echo $lines | awk '{print $2}')
hasta2=$(( $hasta + 2 ))
todayhasta=$(wget covid19.saglik.gov.tr -q -O - | awk NR=="${hasta2}" | awk '{print $2}' | tr -dc '.0-9')

# günlük vefat sayısı
vefat=$(echo $lines | awk '{print $3}')
vefat2=$(( $vefat + 2 ))
todayvefat=$(wget covid19.saglik.gov.tr -q -O - | awk NR=="${vefat2}" | awk '{print $2}' | tr -dc '.0-9')

# günlük iyileşen sayısı
iyilesen=$(echo $lines | awk '{print $4}')
iyilesen2=$(( $iyilesen + 2 ))
todayiyilesen=$(wget covid19.saglik.gov.tr -q -O - | awk NR=="${iyilesen2}" | awk '{print $2}' | tr -dc '.0-9')

# günlük veriler

if [[ $1 =~ ^(-od|--onlydata) ]] ; then
echo "Bu Günkü Test Sayısı: ${todaytest}"
echo "Bu Günkü Hasta Sayısı: ${todayhasta}"
echo "Bu Günkü Vefat Sayısı: ${todayvefat}"
echo -e "Bu Gün1kü İyileşen Sayısı: ${todayiyilesen}\n\n a script by lazy-pwny - https://github.com/lastpingu"
else
banner
echo -ne "             ${datetoday}${kirmizi}" ; date | awk '{print $2}' ; echo -ne "${tp}"
echo "    _______________________________________"
echo -e "    |[${blink}${mavi}*${tp}] Bu Günkü Test Sayısı:     ${kr}${todaytest}${tp} |"
echo -e "    |[${blink}${mavi}*${tp}] Bu Günkü Hasta Sayısı:    ${kirmizi}${todayhasta}${tp}  |"
echo -e "    |[${blink}${mavi}*${tp}] Bu Günkü Vefat Sayısı:    ${kirmizi}${todayvefat}${tp}     |"
echo -e "    |[${blink}${mavi}*${tp}] Bu Günkü İyileşen Sayısı: ${yesil}${todayiyilesen}${tp}  |"
echo "    _______________________________________"
fi
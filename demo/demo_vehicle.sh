#!/bin/bash

clear

HOST=http://localhost:8080

# 1 COMMAND [GET, PUT, POST, ...
# 2 URL
# 3 FORMAT [JSON, XML, NONE = = DEFAULT=JSON]
# 4 [DATA]
MakeRequest() {
  if [ -z "$4" ];
  then
    echo method: $1, endpoint: $HOST$2, format: ${3:json}
    echo ""
    curl --include -X $1 --header "Accept: application/${3:json}" $HOST$2
  else
    echo method: $1, endpoint: $HOST$2, format: $3, data: $4
    echo ""
    curl --include -X $1 --header "Content-Type: application/$3" --header "Accept: application/$3" --data @sample_data/$4.$3 $HOST$2
  fi
  echo -e "\n"
}


echo "###########################################################"
echo "############## GETTING STORAGE STATUS (JSON) ##############"
echo "###########################################################"
MakeRequest GET /storage json

echo "##########################################################"
echo "############## GETTING STORAGE STATUS (XML) ##############"
echo "##########################################################"
MakeRequest GET /storage xml

echo "##################################################"
echo "############## VEHICLE COUNT (JSON) ##############"
echo "##################################################"
MakeRequest GET /vehicles/count json

echo "#################################################"
echo "############## VEHICLE COUNT (XML) ##############"
echo "#################################################"
MakeRequest GET /vehicles/count xml

echo "#################################################"
echo "############## VEHICLE LIST (JSON) ##############"
echo "#################################################"
MakeRequest GET /vehicles/list json

echo "################################################"
echo "############## VEHICLE LIST (XML) ##############"
echo "################################################"
MakeRequest GET /vehicles/list xml

echo "####################################################"
echo "############## VEHICLE SHOW #3 (JSON) ##############"
echo "####################################################"
MakeRequest GET /vehicles/show/3 json

echo "###################################################"
echo "############## VEHICLE SHOW #3 (XML) ##############"
echo "###################################################"
MakeRequest GET /vehicles/show/3 xml

echo "######################################################"
echo "############## VEHICLE DELETE #3 (JSON) ##############"
echo "######################################################"
MakeRequest DELETE /vehicles/delete/3 json

echo "######################################################"
echo "############## VEHICLE DELETE #4 (XML) ###############"
echo "######################################################"
MakeRequest DELETE /vehicles/delete/4 xml

echo "#################################################"
echo "############## VEHICLE LIST (JSON) ##############"
echo "#################################################"
MakeRequest GET /vehicles/list json

echo "################################################"
echo "############## VEHICLE ADD (JSON) ##############"
echo "################################################"
MakeRequest POST /vehicles/add json new_vehicle

echo "################################################"
echo "############## VEHICLE ADD (XML) ###############"
echo "################################################"
MakeRequest POST /vehicles/add xml new_vehicle

echo "#################################################"
echo "############## VEHICLE LIST (JSON) ##############"
echo "#################################################"
MakeRequest GET /vehicles/list json

echo "######################################################"
echo "############## VEHICLE UPDATE #7 (JSON) ##############"
echo "######################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle

echo "#####################################################"
echo "############## VEHICLE UPDATE #8 (XML) ##############"
echo "#####################################################"
MakeRequest PUT /vehicles/update/8 xml update_vehicle

echo "#################################################"
echo "############## VEHICLE LIST (JSON) ##############"
echo "#################################################"
MakeRequest GET /vehicles/list json

echo "########################################################################"
echo "############## VEHICLE UPDATE #7 null plate number (JSON) ##############"
echo "########################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_null_plate

echo "#################################################################################"
echo "############## VEHICLE UPDATE #7 wrong plate number AA12345 (JSON) ##############"
echo "#################################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_plate_AA12345

echo "##################################################################################"
echo "############## VEHICLE UPDATE #7 wrong plate number ABC12345 (JSON) ##############"
echo "##################################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_plate_ABC12345

echo "############################################################################"
echo "############## VEHICLE UPDATE #7 wrong engine capacity (JSON) ##############"
echo "############################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_engine_capacity

echo "##################################################################"
echo "############## VEHICLE UPDATE #7 wrong brand (JSON) ##############"
echo "##################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_brand

echo "#########################################################################"
echo "############## VEHICLE UPDATE #7 wrong seats number (JSON) ##############"
echo "#########################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_seats

echo "###############################################################################"
echo "############## VEHICLE UPDATE #7 wrong first reg date 1st (JSON) ##############"
echo "###############################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_first_reg_1

echo "###############################################################################"
echo "############## VEHICLE UPDATE #7 wrong first reg date 2st (JSON) ##############"
echo "###############################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_first_reg_2

echo "##############################################################################"
echo "############## VEHICLE UPDATE #7 wrong ID issue date 1st (JSON) ##############"
echo "##############################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_ID_issue_date_1

echo "##############################################################################"
echo "############## VEHICLE UPDATE #7 wrong ID issue date 2nd (JSON) ##############"
echo "##############################################################################"
MakeRequest PUT /vehicles/update/7 json update_vehicle_wrong_ID_issue_date_2

echo "####################################################"
echo "############## VEHICLE SHOW #7 (JSON) ##############"
echo "####################################################"
MakeRequest GET /vehicles/show/7 json
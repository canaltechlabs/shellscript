#!/usr/bin/env bash -l

echo "Set AWS environment"
echo "1 - Production"
echo "2 - Development"
echo "3 - Sandbox"

printf "Choose environment: "
read ENV

echo "Set Region"
echo "1 - Ohio - us-east-2"
echo "2 - Sao Paulo - sa-east-1"
read REGION

if [ "$REGION" -eq "1" ]; then
REGION="us-east-2"
elif [ "$REGION" -eq "2" ]; then
REGION="sa-east-1"
else
echo "Option invalid"
exit 0
fi

case $ENV in
1)
export AWS_PROFILE=prod
export AWS_DEFAULT_REGION=$REGION
export REGION=$REGION
;;
2)
export AWS_PROFILE=dev
export AWS_DEFAULT_REGION=$REGION
export REGION=$REGION
;;
3)
export AWS_PROFILE=sbx
export AWS_DEFAULT_REGION=$REGION
export REGION=$REGION
;;
*)
 echo "Invalid Option"
esac

echo "Defined Variables"
env | grep AWS_PROFILE
env | grep REGION

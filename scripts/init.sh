# getting builded fronted
curl -L https://github.com/timeflow-one/rpi-relay-controller-console/releases/download/$(curl -s https://raw.githubusercontent.com/timeflow-one/rpi-relay-controller-console/master/package.json | grep -Po -m 1 '\d.\d.\d')/rpi-relay-controller-console.tar > page/rpi-relay-controller-console.tar
cd page
tar -xf rpi-relay-controller-console.tar
rm rpi-relay-controller-console.tar
cd ..

# getting docker image
# TODO replace FILEID
FILEID='13EgC5YNOh7zTKlBdeig7UuSAw8ApyOA9'
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate \"https://docs.google.com/uc?export=download&id=${FILEID}\" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${FILEID}" -O /tmp/rpi-relay-controller.tar && rm -rf /tmp/cookies.txt
docker load -i /tmp/rpi-relay-controller.tar

# set timeflow server controll
sed -i 's/{TIMEFLOW_SERVER_PREFIX}/ru/g' nginx/controller.conf

docker-compose up -d

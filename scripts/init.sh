# getting builded fronted
curl -L https://github.com/timeflow-one/rpi-relay-controller-console/releases/download/$(curl -s https://raw.githubusercontent.com/timeflow-one/rpi-relay-controller-console/master/package.json | grep -Po -m 1 '\d.\d.\d')/rpi-relay-controller-console.tar > page/rpi-relay-controller-console.tar
cd page
tar -xf rpi-relay-controller-console.tar
rm rpi-relay-controller-console.tar
cd ..

# getting docker image
FILEID="13EgC5YNOh7zTKlBdeig7UuSAw8ApyOA9"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${FILEID}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${FILEID}" -o /tmp/rpi-relay-controller.tar
docker load -i /tmp/rpi-relay-controller.tar

# set timeflow server controll
sed -i 's/{TIMEFLOW_SERVER_PREFIX}/ru/g' nginx/controller.conf

docker-compose up -d

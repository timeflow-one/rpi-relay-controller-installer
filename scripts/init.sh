# getting builded fronted
curl -L https://github.com/timeflow-one/rpi-relay-controller-console/releases/download/$(curl -s https://raw.githubusercontent.com/timeflow-one/rpi-relay-controller-console/master/package.json | grep -Po -m 1 '\d.\d.\d')/rpi-relay-controller-console.tar > page/rpi-relay-controller-console.tar
cd page
tar -xf rpi-relay-controller-console.tar
rm rpi-relay-controller-console.tar
cd ..

# getting docker image
# TODO replace ... to archive location
curl ... > /tmp/rpi-relay-controller.tar
docker load -i /tmp/rpi-relay-controller.tar

# set timeflow server controll
sed -i 's/{TIMEFLOW_PREFIX_SERVER}/ru/g' nginx/controller.conf

docker-compose up

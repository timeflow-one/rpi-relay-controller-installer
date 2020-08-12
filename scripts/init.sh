# gitting builded fronted
curl https://github.com/timeflow-one/rpi-relay-controller-console/releases/download/2.0.0/rpi-relay-controller-console.tar > page/rpi-relay-controller-console.tar
cd page
tar -xf rpi-relay-controller-console.tar .
rm rpi-relay-controller-console.tar
cd ..

# set timeflow server controll
sed -i 's/{TIMEFLOW_PREFIX_SERVER}/ru/g' nginx/controller.conf

docker-compose up

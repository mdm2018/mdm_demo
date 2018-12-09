#!/bin/sh

basedir=`pwd | awk -F "/" '{print $NF}'`
docker-compose up -d
docker exec -i ${basedir}_m_1 mysql -uroot -e "CREATE DATABASE IF NOT EXISTS openmdmserver;"
cat openmdmserver.sql | docker exec -i ${basedir}_m_1 mysql -uroot openmdmserver
while [ ! $? -eq 0 ]
do
    echo "retry ..."
    sleep 3
    docker exec -i ${basedir}_m_1 mysql -uroot -e "CREATE DATABASE IF NOT EXISTS openmdmserver;"
    cat openmdmserver.sql | docker exec -i ${basedir}_m_1 mysql -uroot openmdmserver
done
docker restart -t 0 ${basedir}_s_1
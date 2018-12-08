#!/bin/sh
cat openmdmserver.sql | docker exec -i openmdmserver-master_m_1 mysql -uroot openmdmserver
docker-compose up -d
docker restart -t 0 openmdmserver-master_s_1